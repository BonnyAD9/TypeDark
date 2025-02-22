const std = @import("std");

const allocator = std.heap.page_allocator;

fn VecDeque(T: type) type {
    return struct {
        data: []T,
        first: usize,
        len: usize,
        allocator: std.mem.Allocator,

        pub fn init(al: std.mem.Allocator) @This() {
            return @This() {
                .data = &.{},
                .first = 0,
                .len = 0,
                .allocator = al,
            };
        }

        fn idx(self: *@This(), i: usize) usize {
            return if (i >= self.data.len) i - self.data.len else i;
        }

        fn at(self: *@This(), i: usize) *T {
            std.debug.assert(i < self.len);
            return &self.data[self.idx(self.first + i)];
        }

        fn push(self: *@This(), item: T) !void {
            if (self.len >= self.data.len) {
                const old_len = self.data.len;
                self.data = try self.allocator.realloc(
                    self.data,
                    @max(16, self.len * 2)
                );
                if (self.first + self.len > old_len) {
                    const len = self.first + self.len - old_len;
                    std.mem.copyForwards(
                        T,
                        self.data[0..len],
                        self.data[old_len..old_len + len]
                    );
                }
            }
            self.data[self.idx(self.first + self.len)] = item;
            self.len += 1;
        }

        fn pop(self: *@This()) ?T {
            if (self.len == 0) {
                return null;
            }
            const item = self.data[self.first];
            self.first = self.idx(self.first + 1);
            self.len -= 1;
            return item;
        }

        fn deinit(self: *@This()) void {
            self.allocator.free(self.data);
            self.* = @This().init(self.allocator);
        }
    };
}

const Cube = struct {
    value: u64,
    hist: u64,

    fn fromValue(value: u64) @This() {
        var hist: u64 = 0;
        const val = value * value * value;
        var n = val;
        while (n != 0) {
            hist += @as(u64, 1) << @intCast(n % 10 * 6);
            n /= 10;
        }

        return @This() {
            .value = val,
            .hist = hist,
        };
    }

    fn maxHist(self: *const @This()) u64 {
        var hist = self.hist;
        var res: u64 = 0;
        var d: u6 = 10;
        while (d > 0) {
            d -= 1;
            const pow = @as(u64, 1) << (d * 6);
            while (hist >= pow) : (hist -= pow) {
                res = res * 10 + d;
            }
        }
        return res;
    }
};

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("{!}\n", .{cubicPermutations(5)});

    try bw.flush();
}

fn cubicPermutations(count: usize) !u64 {
    var queue = VecDeque(Cube).init(allocator);
    defer queue.deinit();
    try queue.push(Cube.fromValue(3));

    var next: u64 = 4;
    while (queue.pop()) |cube| {
        if (cube.value == 0) {
            continue;
        }
        const lim = cube.maxHist();
        var cnt: usize = 1;

        // search in cubes that are already calculated
        for (0..queue.len) |i| {
            const c = queue.at(i);
            if (c.value > lim) {
                if (cnt == count) {
                    return cube.value;
                }
            }
            if (c.hist == cube.hist) {
                cnt += 1;
                c.value = 0;
            }
        }

        // generate new cubes
        while (true) {
            const nextCube = Cube.fromValue(next);
            next += 1;
            if (nextCube.value > lim) {
                try queue.push(nextCube);
                break;
            }
            if (nextCube.hist == cube.hist) {
                cnt += 1;
            } else {
                try queue.push(nextCube);
            }
        }

        if (cnt == count) {
            return cube.value;
        }
    }

    return error.NoSolution;
}
