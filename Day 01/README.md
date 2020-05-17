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

## 变量:
Lua 变量有三种类型：全局变量、局部变量、表中的域。Lua 中的变量全是全局变量，那怕是语句块或是函数里，除非用 local 显式声明为局部变量。

## 索引:
```lua
t[i]
t.i                 -- 当索引为字符串类型时的一种简化写法
gettable_event(t,i) -- 采用索引访问本质上是一个类似这样的函数调用
```

## for循环:
```lua
for var=exp1,exp2,exp3 do  
    <执行体>  
end  
```
var 从 exp1 变化到 exp2，每次变化以 exp3 为步长递增 var，并执行一次 "执行体"。exp3 是可选的，如果不指定，默认为1。

泛型 for 循环通过一个迭代器函数来遍历所有值，类似 java 中的 foreach 语句。Lua 编程语言中泛型 for 循环语法格式:
```lua
--打印数组a的所有值  
a = {"one", "two", "three"}
for i, v in ipairs(a) do
    print(i, v)
end 
```
i是数组索引值，v是对应索引的数组元素值。ipairs是Lua提供的一个迭代器函数，用来迭代数组。

## goto 语句:
Lua 语言中的 goto 语句允许将控制流程无条件地转到被标记的语句处。
```lua
--[[ Syntax
goto Label
:: Label ::
--]]
local a = 1
::label:: print("--- goto label ---")

a = a+1
if a < 3 then
    goto label   -- a 小于 3 的时候跳转到标签 label
end
```

## 函数: 
Syntax:
```lua
optional_function_scope function function_name( argument1, argument2, argument3..., argumentn)
    function_body
    return result_params_comma_separated
end
```
Lua 中可以将函数作为参数传递给函数:
[Click here](https://github.com/qiaw99/Lua-selflearning/blob/master/Day%2001/myprint.lua)

Lua函数可以返回多个结果值，比如string.find，其返回匹配串"开始和结束的下标"（如果不存在匹配串返回nil）.

### 可变参数: 
Lua 函数可以接受可变数目的参数，和 C 语言类似，在函数参数列表中使用三点 ... 表示函数有可变的参数。
[Click here](https://github.com/qiaw99/Lua-selflearning/blob/master/Day%2001/varPara.lua)

可以通过 select("#",...) 来获取可变参数的数量:
```lua
function average(...)
   result = 0
   local arg = {...}
   for i,v in ipairs(arg) do
      result = result + v
   end
   print("总共传入 " .. select("#", ...) .. " 个数")
   return result / select("#", ...)
end

print("平均值为",average(10, 5, 3, 4, 5, 6))
```
有时候可能需要几个固定参数加上可变参数，固定参数必须放在变长参数之前:
```lua
function fwrite(fmt, ...)  ---> 固定的参数fmt
    return io.write(string.format(fmt, ...))    
end

fwrite("qiaw99\n")       --->fmt = "qiaw99", 没有变长参数。  
fwrite("%d %d\n", 1, 2)   --->fmt = "%d %d", 变长参数为 1 和 2
```

通常在遍历变长参数的时候只需要使用 {…}，然而变长参数可能会包含一些 nil，那么就可以用 select 函数来访问变长参数了：select('#', …) 或者 select(n, …)
- select('#', …) 返回可变参数的长度
- select(n, …) 用于返回 n 到 select('#',…) 的参数
[Click here](https://github.com/qiaw99/Lua-selflearning/blob/master/Day%2001/select.lua)
