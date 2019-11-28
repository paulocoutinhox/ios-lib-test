#include "library.hpp"

#include <iostream>
#include <sstream>
#include <string>

void cppTestOne(void)
{
    std::cout << "Starting..." << std::endl;
    uint8_t ch = 0xb6;
    std::ostringstream buf;

    std::string str;

    buf << static_cast<char>(ch);

    buf << str;

    std::cout << buf.str() << std::endl;

    std::cout << "Finished" << std::endl;
}