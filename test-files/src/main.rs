pub struct Vec2<T = usize> {
    pub x: T,
    pub y: T,
}

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
