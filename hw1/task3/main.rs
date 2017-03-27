fn main() {}

fn count(line: &str, c: char) -> u64 {
}

#[test]
fn test_one_char() {
    assert_eq!(count("♥ The quick brown fox jumps over the lazy dog. ♥", 'T'),
               1);
}

#[test]
fn test_four_char() {
    assert_eq!(count("♥ The quick brown fox jumps over the lazy dog. ♥", 'o'),
               4);
}

#[test]
fn test_no_char() {
    assert_eq!(count("♥ The quick brown fox jumps over the lazy dog. ♥", '!'),
               0);
}
