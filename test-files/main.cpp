#include <iostream>

typedef struct Str Str;
#define HI 5

int main() {
    struct Str s = {};
    constexpr int con = 0;
    unsigned int i = 0;
    bool hi = true;
}

struct Str {
    size_t st = 5;
    Str() = default;
};

class Hello {

};

template<typename T>
concept Hashable = requires(T a)
{
    { std::hash<T>{}(a) } -> std::convertible_to<std::size_t>;
};

enum class hello {

};
