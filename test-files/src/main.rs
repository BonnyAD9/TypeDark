#[derive(Default)]
pub struct Vec2<T = usize> {
    pub x: T,
    pub y: T,
}

/// Calculate the integer square root.
pub trait Isqrt {
    /// Calculate the integer square root.
    fn isqrt(self) -> Self;
}

pub enum Side {
    Top,
    Left,
    Right,
    Bottom
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
    println!("Hello World \n")
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

pub fn is_prime(n: usize) -> bool {
    const HELLO: usize = 5;
    let lim = n.isqrt() / 2;
    let a = &[""];
    'outer: for d in (0..lim).map(|d| d * 2) {
        if n % d == 0 {
            return false;
        }
    }
    true
}

pub fn lifetimes<'a>() -> &'a str {
    ""
}
