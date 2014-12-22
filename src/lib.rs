use std::num::{Int, Float};

#[deriving(Copy)]
pub struct Point { x: int, y: int }

struct Line { p1: Point, p2: Point }

impl Line {
    pub fn length(&self) -> f64 {
        let xdiff = self.p1.x - self.p2.x;
        let ydiff = self.p1.y - self.p2.y;
        ((xdiff.pow(2) + ydiff.pow(2)) as f64).sqrt()
    }
}

#[no_mangle]
pub extern "C" fn make_point(x: int, y: int) -> Box<Point> {
    box Point { x: x, y: y }
}

#[no_mangle]
pub extern "C" fn get_distance(p1: &Point, p2: &Point) -> f64 {
    Line { p1: *p1, p2: *p2 }.length()
}

#[cfg(test)]
mod tests {
    use super::{Point, get_distance};
    use std::num::FloatMath;
    #[test]
    fn test_get_distance() {
        let p1 = Point { x: 2, y: 2 };
        let p2 = Point { x: 4, y: 4 };
        assert!((get_distance(&p1, &p2).abs_sub(2.828427) < 0.01f64));
    }
}
