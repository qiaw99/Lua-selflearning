不等于 ~=

".." --> 连接两个字符串	

"#" -> 	一元运算符，返回字符串或表的长度。

# 字符串:
## Syntax:
- 单引号间的一串字符。
- 双引号间的一串字符。
- \[\[ 与 \]\] 间的一串字符。

## Operations: 
1. string.upper(argument): 字符串全部转为大写字母。
2. string.lower(argument): 字符串全部转为小写字母。
3. string.gsub(mainString,findString,replaceString,num): 在字符串中替换。
mainString 为要操作的字符串， findString 为被替换的字符，replaceString 要替换的字符，num 替换次数（可以忽略，则全部替换)
```lua
string.gsub("aaaa","a","z",3);
--> zzza    3
```
4. string.find (str, substr, \[init, \[end\]\]): 在一个指定的目标字符串中搜索指定的内容(第三个参数为索引),返回其具体位置。不存在则返回 nil。
```lua
string.find("Hello Lua user", "Lua", 1) 
--> 7    9
```
5. string.reverse(arg): 字符串反转
6. string.format(...): 返回一个类似printf的格式化字符串
```lua
string.format("the value is:%d",4)
-> the value is:4
```
7. string.char(arg) 和 string.byte(arg\[,int\]): char 将整型数字转成字符并连接， byte 转换字符为整数值(可以指定某个字符，默认第一个字符)。
```lua
string.char(97,98,99,100)
--> abcd

string.byte("ABCD",4)
--> 68

string.byte("ABCD")
--> 65
```
8. string.len(arg): 计算字符串长度。
9. string.rep(string, n): 返回字符串string的n个拷贝
10. string.gmatch(str, pattern): 
回一个迭代器函数，每一次调用这个函数，返回一个在字符串 str 找到的下一个符合 pattern 描述的子串。如果参数 pattern 描述的字符串没有找到，迭代函数返回nil。
```lua
for word in string.gmatch("Hello Lua user", "%a+") do 
  print(word) 
end

--> 
Hello
Lua
user
```
11. string.match(str, pattern, init): 
string.match()只寻找源字串str中的第一个配对. 参数init可选, 指定搜寻过程的起点, 默认为1。
在成功配对时, 函数将返回配对表达式中的所有捕获结果; 如果没有设置捕获标记, 则返回整个配对字符串. 当没有成功的配对时, 返回nil。
```lua
string.match("I have 2 questions for you.", "%d+ %a+")
--> 2 questions

string.format("%d, %q", string.match("I have 2 questions for you.", "(%d+) (%a+)"))
--> 2, "questions"
```

下面的表列出了Lua支持的所有字符类：

单个字符(除 ^$()%.\[\]\*+-? 外): 与该字符自身配对
- .(点): 与任何字符配对
- %a: 与任何字母配对
- %c: 与任何控制符配对(例如\n)
- %d: 与任何数字配对
- %l: 与任何小写字母配对
- %p: 与任何标点(punctuation)配对
- %s: 与空白字符配对
- %u: 与任何大写字母配对
- %w: 与任何字母/数字配对
- %x: 与任何十六进制数配对
- %z: 与任何代表0的字符配对
- %x(此处x是非字母非数字字符): 与字符x配对. 主要用来处理表达式中有功能的字符(^$()%.[]*+-?)的配对问题, 例如%%与%配对
- \[数个字符类\]: 与任何\[\]中包含的字符类配对. 例如\[%w_\]与任何字母/数字, 或下划线符号(\_)配对
\[^数个字符类\]: 与任何不包含在\[\]中的字符类配对. 例如\[^%s\]与任何非空白字符配对

# 数组: 
可以使用整数索引来访问数组元素，如果知道的索引没有值则返回nil。在 Lua 索引值是以 1 为起始，但也可以指定 0 开始。

除此还可以以负数为数组索引值：
```lua
array = {}

for i= -2, 2 do
   array[i] = i *2
end

for i = -2,2 do
   print(array[i])
end

--> 
-4
-2
0
2
4
```

# 迭代器:
迭代器（iterator）是一种对象，它能够用来遍历标准模板库容器中的部分或全部元素，每个迭代器对象代表容器中的确定的地址。 在 Lua 中迭代器是一种支持指针类型的结构，它可以遍历集合的每一个元素。

## 泛型 for 迭代器: 
