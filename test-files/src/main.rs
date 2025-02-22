pub struct Vec2<T = usize> {
    pub x: T,
    pub y: T,
}

/// Calculate the integer square root.
pub trait Isqrt {
    /// Calculate the integer square root.
    fn isqrt(self) -> Self;
}

macro_rules! impl_isqrt {
    ($($i:ident),*) => {
        $(impl Isqrt for $i {
            fn isqrt(self) -> Self {
                $i::isqrt(self)
            }
        })*
    };
}

impl_isqrt!(
    u8, i8, u16, i16, u32, i32, u64, i64, usize, isize, u128, i128
);


fn main() {
    println!("Hello World")
}

impl<T> crate::Vec2<T> {
    pub fn new(x: T, y: T) -> Self {
        Self { x, y }
    }
}

impl self::Vec2 {
    pub fn abs(&self) -> usize {
        (self.x * self.x + self.y * self.y).isqrt()
    }
}
