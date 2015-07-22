#include <string>
#include <functional>
#include <cxxtools/directory.h>
#include <cxxtools/fileinfo.h>

struct Action_Meta {
    std::string name;
    std::string icon;
    bool for_dir;
    bool for_file;
    bool show_default;
};

struct Action {
    Action_Meta meta;
    std::function<std::string(std::string)> action;
};

