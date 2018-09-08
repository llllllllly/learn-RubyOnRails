#!/usr/bin/ruby

# 学习申思维的 ruby 入门教程 
# http://web.siwei.me/part3_rails_premier/ruby_premier.html

# 赋值
name = "llllllllly"
puts name

# 字符串插槽
puts "hi, #{name}"

# 任何语言都通用的数据类型
# 字符串 String
s = "String"
puts s

# 数字 Number
n = 1
puts n

# 数组 Array
a = [1, 2, "c"]
puts a

# 哈希 Hash (别的语言的 dictionary )
h = {
    "name": "llllllllly",
    "email": "teaocat@gmail.com"
}
puts h

# Class 
class Apple
    # Apple.new 的时候调用该方法
    def initialize
        # 实例变量
        @color
    end

    # get color 方法
    def color
        @color
    end

    # set color 方法
    def color= color
        @color = color
    end

    # private 修饰符下面的都是私有方法; 反之, 在它上面的都是公开
    private

    def i_am_private
    end
end

red_apple = Apple.new
red_apple.color = 'red'
puts "red_apple.color: #{red_apple.color}"

# 上面的例子是java/c风格的. ruby的熟手一般这么写：
class Orange
     # 这一句，自动声明了 @color, getter,setter
    attr_accessor 'color'
end

yellow_orange = Orange.new
yellow_orange.color = 'yellow'
puts "yellow_orange: #{yellow_orange.color}"

# 变量
=begin
类变量: @@eat     用的很少
实例变量: @color
普通变量: age
全局变量: $name   用的更少
=end

# 类方法 与 实例方法
class Banana
    #类方法
    def Banana.name
        'banana'
    end
    #实例方法
    def color
        'yellow'
    end
end

# Symbol 它是不会变化的字符串
symbol = :llllllllly
# 前面的apple例子中，　正常的应该写成：
class Apples
    attr_accessor :color
end

apple = Apples.new
apple.color = 'red'
puts "apple.:color #{apple.color}"

# hash
# 任何情况下都生效的语法： =>
llllllllly = {
    :name => 'llllllllly',
    :age => 23
}

# Ruby 1.9之后产生的语法：更加简洁
llllllllly = {
    name: 'llllllllly',
    age: 23
}

# 也可以写成
llllllllly = {}
llllllllly[:name] = 'llllllllly'
llllllllly[:age] = 23

# 但是 Symbol 和 String 是不同的 key
llllllllly = {
    :name => 'llllllllly',
    "name" => 'llllllllly'
}
puts llllllllly[:name]
puts llllllllly["name"]

# 每个函数的最后一行默认是返回值, 不需要写 return的
# 方法调用的最外面的小括号可以省略
puts "你好" 
puts("你好啊")

# hash 最外面的 {} 在大多数情况下可以省略
# 具体的省略: 如果 hash 是某方法的最后一个参数 (不考虑 block 的情况), 那么最外层 {} 可以省略

# Apple.create :name => 'apple', :color => 'red'
# 等价于
# Apple.create({:name => 'apple', :color => 'red'})

# 条件语句
# if else end 是最常见的
a = 1
if a == 1
    puts "a is 1"
elsif a == 2
    puts "a is 2"
else
    puts "a is not in [1, 2]"
end

# case when end 分支语句
a = 1
case a
when 1 then puts "a is 1"
when 2 then puts "a is 2"
when 3, 4, 5 then puts "a is in [3, 4, 5]"
else puts "a is not in [1,2,3,4,5]"
end 

# 三元表达式
a = 1
puts a == 1 ? 'one' : 'not one'

# for, each, loop, while 循环
# for 和 each 几乎一样
[1, 2, 3].each { |e|
    puts e
}

for e in [1, 2, 3]
    puts e
end
#区别就是 for 是关键字, each 是方法. 因为 for 后面的变量是全局变量, 所以高手都推荐使用 each

# loop与while是几乎一样的
a = [2, 1 , 0, -1, -2]
loop do
  current_element = a.shift
  puts current_element
  break if current_element <= 0
end

# 命名规则
# 常量: 变量名 全大写
# 变量: 不包括 @@, @, $的情况下, 小写字母开头, 下划线拼接
# class, module: 首字母大写, 后面驼峰式写法
# 方法名: 小写字母开头, 可以以 ? 号, = 号结尾

# :: 双冒号
# 表示 class 的 常量, 也表示 某个命名空间
class Interface
    class Apple
        COLOR = 'red'
    end
end
  
puts Interface::Apple::COLOR

# block, proc, lambda 几乎是一样的. 都表示代码块儿
# 代码块 最后一行代码默认是返回值


# do ...end 与 { } 几乎是一样的
[1, 2, 3].each { |e|
    puts e
}

[1, 2, 3].each do |e|
    puts e
end

# 一个方法最多只有一个参数是 block, 并且永远是参数的最后一位

# 简写
give "我", :what => '咖啡', :count => '2', :unit => '杯' do
    "味道不错哟!"
end

# 等价于
give(
    "我",  # => 第一个参数,是一个 string
    {:what => '咖啡', :count => '2', :unit => '杯'},  # => 第二个参数,是个hash
    do "味道不错哟!" end   # => 这是第三个参数,是一个block. 也是最后一个参数
)