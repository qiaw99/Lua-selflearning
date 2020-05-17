# Day 1
Download: https://www.lua.org/download.html

## 脚本式编程
hello.lua
```lua
#!/usr/local/bin/lua

print("Hello World！")
```
#!/usr/local/bin/lua 指定了 Lua 的解释器 /usr/local/bin directory。加上 # 号标记解释器会忽略它。为脚本添加可执行权限就可以直接执行了：
1. __chmod 777 hello.lua__
2. __./hello.lua__
### 单行注释:
```lua
--
```

### 多行注释:
```lua
--[[
 多行注释
 多行注释
 --]]
```

## Lua 数据类型
nil, boolean, number, string, userdata, function, thread, table.

- userdata: userdata 是一种用户自定义数据，用于表示一种由应用程序或 C/C++ 语言库所创建的类型，可以将任意 C/C++ 的任意数据类型的数据（通常是 struct 和 指针）存储到 Lua 变量中调用。
- thread:表示执行的独立线路，用于执行协同程序
- table:	Lua 中的表（table）其实是一个"关联数组"（associative arrays），数组的索引可以是数字、字符串或表类型。在 Lua 里，table 的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表。

### nil:
nil 类型表示一种没有任何有效值，它只有一个值 -- nil，例如打印一个没有赋值的变量，便会输出一个 nil 值.
```lua
print(type(x))
--> nil
```
对于全局变量和 table，nil 还有一个"删除"作用，给全局变量或者 table 表里的变量赋一个 nil 值，等同于把它们删掉
[Click here](https://github.com/qiaw99/Lua-selflearning/blob/master/Day%2001/nil.lua)

nil 作比较时应该加上双引号 "：
```
> type(X)
nil
> type(X)==nil
false
> type(X)=="nil"
true
```

## string: 
字符串由一对双引号或单引号来表示。也可以用 2 个方括号 "\[\[\]\]" 来表示"一块"字符串。
```lua
html = [[
<html>
<head></head>
<body>
    <a href="http://www.github.com/qiaw99">Lua-selflearning</a>
</body>
</html>
]]
print(html)
```

在对一个数字字符串上进行算术操作时，Lua 会尝试将这个数字字符串转成一个数字:
```lua
> print("2" + 6)
8.0
> print("2" + "6")
8.0
> print("2 + 6")
2 + 6
> print("-2e2" * "6")
-1200.0
> print("error" + 1)
stdin:1: attempt to perform arithmetic on a string value
stack traceback:
        stdin:1: in main chunk
        [C]: in ?
```
- 字符串连接使用 .. 
- \# 来计算字符串的长度，放在字符串前面

## table:
在 Lua 里，table 的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表。也可以在表里添加一些数据，直接初始化表:
```lua
-- 创建一个空的 table
local tbl1 = {}
 
-- 直接初始表
local tbl2 = {"apple", "pear", "orange", "grape"}
```
- 不同于其他语言的数组把 0 作为数组的初始索引，在 Lua 里表的默认初始索引一般以 1 开始。
- table 不会固定长度大小，有新数据添加时 table 长度会自动增长，没初始的 table 都是 nil。

# function:
function 可以以匿名函数（anonymous function）的方式通过参数传递:
[Click here](https://github.com/qiaw99/Lua-selflearning/blob/master/Day%2001/testFun.lua)

