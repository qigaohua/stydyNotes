#!/bin/bash

:||{

/**
* @file bash_study.sh
* @brief  shell脚本学习记录
* @author qigaohua, qigaohua168@163.com
* @version 1.0.0
* @date 2018-06-26
*/

}


##################################################################################################################
#                                          bash 基础部分学习                                                     #
##################################################################################################################

# 一、bash示例和书写流程
# 1. 新建文件
# 2. 给文件添加运行权限 chmod +x new_file
# 3. 示例

echo "hello bash"
# exit 0


##########################################################

# 二、条件判断

# 条件判断有2种格式，分别是“test EXPRESSION”和“[ EXPRESSION ]”
# “test”判断语句，在实际中应用的比较少；相反的，“[]”判断语句应用很广

# 1.test 判断语句
#   基本格式
#       test EXPRESSION
#   格式说明
#       test是关键字，表示判断
#       EXPRESSION 是被判断得语句
#   关于EXPRESSION的说明,参考如下:
#       -d FILE   判断文件是不是目录
#       -f FILE   判断FILE是不是正规文件
#       -L FILE   判断FILE是不是符号链接
#       -r FILE   判断FILE是不是可读
#       -s FILE   判断FILE是不是文件长度大于0, 非空
#       -w FILE   判断FILE是不是可写
#       -u FILE   判断FILE是不是有suid位设置
#       -x FILE   判断FILE是不是可执行

# 2. [] 条件判断
#   基本格式
#       [ EXPRESSION ]
#   格式说明
#       中括号的左右扩弧和EXPRESSION之间都必须有空格!
#   关于EXPRESSION的说明，参考如下:
#       (EXPRESSION)                              EXPRESSION 为真
#       !EXPRESSION                               EXPRESSION 为假
#       EXPRESSION1 -a EXPRESSION2                EXPRESSION1 和 EXPRESSION2 同时为真
#       EXPRESSION1 -o EXPRESSION2                EXPRESSION1 或 EXPRESSION2 为真
#       -n string                                 string 长度不为0
#       -z string                                 string 长度为0
#       string1 == string2                        字符串相等
#       string1 != string2                        字符串不相等
#       integer1 -eq integer2                     等于
#       integer1 -gt integer2                     大于
#       integer1 -ge integer2                     大于或等于
#       integer1 -lt integer2                     小于
#       integer1 -le integer2                     小于或等于
#       integer1 -ne integer2                     不等于
#       file1 -ef file2                           file1 和 file2 有相同的device和inode数目
#       file1 -nt file2                           file1 的修改时间早于 file2
#       file1 -ot file2                           file1 的修改时间晚于 file2
#       -b file                                   file 是块设备，
#       -c file                                   file 是字符设备，
#       -d file                                   file 是目录，
#       -e file                                   file 存在
#       -f file                                   file 存在, 且是一个普通文件
#       -g file                                   file 存在，且有group-id
#       -G file                                   file 存在，且group-id是有效的
#       -h file                                   file 存在，是一个硬链接
#       -k file                                   file 存在，且他的sticky bit被设置了
#       -L file                                   file 存在，是一个软链接
#       -O file                                   file 存在，且他的拥有者是有效的
#       -p file                                   file 存在，且是一个管道文件
#       -r file                                   file 存在，且可读
#       -s file                                   file 存在，且size为0
#       -S file                                   file 存在，且是socket文件
#       -u file                                   file 存在，且他的set-user-id bit被设置了
#       -w file                                   file 存在，且可写
#       -x file                                   file 存在，且可执行
#       -u FD                                     FD 被终端打开



# 3. 示例
# 判断当前目录下文件bash_studu.sh 是一个普通文件
file="bash_study.sh"
[ -f $file ]
# 判断变量val是否等于字符串“bash_study”
[ "$val" = "bash_study" ]
# 判断变量num是否等于数字100
num=100
if [ $num -eq 100 ]; then
    echo "num = 100"
fi

# 可读且可写
if [ -r $file -a -w $file ]; then
    echo "$file can r and w"
fi

#同上
if [ -r $file ] && [ -w $file ]; then
    echo "$file can r and w"
fi

# 可读或可写
if [ -r $file -o -w $file ]; then
    echo "$file can r or w"
fi

#同上
if [ -r $file ] || [ -w $file ]; then
    echo "$file can r or w"
fi

# 不可读
if [ ! -r $file ]; then
    echo "$file can't read "
fi


#########################################################################################################

# 三、if then else 语句

# 基本格式:
#   if 条件1
#   then
#       命令1
#   elif 条件2
#   then
#       命令2
#   else
#       命令3
#   fi

# 格式说明： if 语句必须以单词 fi 终止。elif 和 else 为可选项,如果语句中没有否则部分,那么就不需要 elif 和 else 部分。
#            if 语句可以有许多 elif 部分。最常用的 if 语句是 if then fi 结构


# 示例1：判断文件bash_stuty.sh 是否存在

if [ -e bash_study.sh ]; then
    echo "file is exist"
else
    echo "file not exist"
fi


# 示例2：提示用户输入一个数字，若输入的值小于0，则输出“negtive number”；若等于0,则输出“number zero”，否则，输出“positive number”。

# -n 提示不换行
echo -n  "Please input a number:"

# 读取用户输入的值到num
read num

if [ $num -eq 0 ]; then
    echo "number zero"
elif [ $num -gt 0 ]; then
    echo "positive number"
else
    echo "negtive number"
fi


################################################################################################################


# 四、case 语句
#   case语句为多选择语句。可以用case语句匹配一个值与一个模式,如果匹配成功,执行相匹配的命令。

# 基本格式：
#   case 值 in
#   模式1)
#       命令1
#   ;;
#   模式2)
#       命令2
#   ;;
#   esac

# 格式说明:
# “模式”部分可能包括元字符，即:
#   *    任意字符
#   ?    任意单字符
#   [..] 类或范围中任意字符


# 示例：提示用户输入Y/y或N/n。若输入Y/y，则输出“yes”；若输入N/n,则输出“no”；否则，“incorrect input”

echo -n "Please input Y/N: "

read val

case $val in
    Y|y)
        echo "Yes"
        ;;
    N|n)
        echo "No"
        ;;
    *)
        echo "incorrect input"
        ;;
esac



###################################################################################################


# 五、 for 循环

# 基本格式
#   for 变量名 in 列表
#   do
#       命令1
#       命令2
#   done

# 格式说明：
#   当变量值在列表里, for循环即执行一次所有命令,使用变量名访问列表中取值。
#   命令可为任何有效的 shell命令和语句。变量名为任何单词。
#   in列表用法是可选的,如果不用它, for循环使用命令行的位置参数

# 示例：输出当前目录所有文件名

cur_dir=`ls`

for file in $cur_dir
do
    if [ -f $file ]; then
        echo "普通文件: $file"
    elif [ -d $file ];then
        echo "目录: $file"
    else
        echo "其他: $file"
    fi
done


# 输出 1-10的总和

sum=0
for ((i=1;i<10;i++))
do
    ((sum=$sum + $i))
done

echo "sum = $sum"


#########################################################################################

# 六、while 循环

# 基本格式:
#   while 条件
#   do
#       命令1
#       命令2
#   done

# 示例: 从0开始逐步递增，当数值等于5时，停止递增

val=0

while [ $val -lt 5 ]
do
    ((val++))
    echo "val = $val"
done


###########################################################################################

# 七、until 循环
# until循环执行一系列命令直至条件为真时停止。until循环与 while循环在处理方式上刚好相反。
# 一般 while循环优于until循环,但在某些时候 — 也只是极少数情况下, until循环更加有用

# 基本格式
# until 条件
# do
#       命令1
#       命令1
# done

# 示例，同上

val=0

until [ $val -eq 5 ]  # 直到val等于5退出循环
do
    ((val++))
    echo "val = $val"
done


###############################################################################################

# 八、使用break和continue控制循环

# 基本格式
#   break命令允许跳出循环。
#   continue命令类似于 break命令,只有一点重要差别,它不会跳出循环,只是跳过这个循环步

# 示例1: 同上

val=0

while true
do
    if [ $val -eq 5 ]; then
        break ;
    fi
    ((val++))
    echo "val = $val"
done

# 示例2: 从0开始逐步递增到10：当数值为5时，将数值递增2；否则，输出数值。

val=0

while [ $val -le 10 ]
do
    if [ $val -eq 5 ]; then
        ((val=$val+2))
        continue ;
    fi

    ((val++))
    echo "val = $val"
done


#######################################################################

# 九、数组部分

# 1、数组定义
#   1.1  array=(10 20 30 40 50)
#       说明: 一对括号表示是数组，数组元素用“空格”符号分割开。引用数组时从序号0开始
#   1.2 除了上面的定义方式外，也可以单独定义数组
#       array[0]=10
#       array[1]=20
#       array[2]=30
#       array[3]=40
#       array[4]=50
#   1.3 var="10 20 30 40 50"; array=($var)

array=(10 20 30 40 50)

# 2、数组操作
#   2.1 显示数组第二个:
echo ${array[1]}
#   2.2 显示数组所有元素
echo ${array[*]}             # way 1
echo ${array[@]}             # way 2
#   2.3 显示数组长度
echo ${#array[*]}            # way 1
echo ${#array[@]}            # way 2
#   2.4 输出数组1-3项元素
echo ${array[*]:0:3}                # 说明：参考“${数组名[@或*]:起始位置:长度}
#   2.5 将数组中的值替换另一个
echo ${array[*]/10/1}               # 说明：${数组名[@或*]/查找字符/替换字符}
#   2.6 删除数组第二项
unset array[1]
echo ${array[@]}
#   2.7 删除整个数组
unset array
echo ${array[@]}



######################################################################################


# 十、函数部分

# 1、函数定义
#   基本格式
#        function func()
#        {
#
#        }
#   格式说明：function可有可无。但建议保留，因为保留的话看起来更加直观

# 2、函数调用和传参
#   调用方法
#       直接通过函数名调用
#   示例:
#       func param1 param2 param3
#   示例说明：
#       调用函数func，并传入param1 param2 param3三个参数

# 3、函数返回值
#   使用方法:
#       return 返回值
#   方法说明:
#       调用func param1 param2 param3之后，再调用$?就是上次调用的返回值


# 应用示例：编辑一个函数func,打印foo的输入参数的总数.并输入每个参数和参数对应的序号

echo "*************************************函数部分********************************************"
function func()
{
    # 定义局部变量 i
    local i=0 ;

    # 获取传入参数的总数
    local total=$# ;
    echo "param total = $total"

    for val in $@
    do
        ((i++))
        echo "$i   $val"
    done

    # 返回参数总数
    return $total
}

# 不传入参数
func

# 传入三个参数
func param1 param2 param3

# 获取上次函数调用返回值
ret=$?
echo "func return ret = $ret"


####################################################################################################


# 十一、数值运算

# 1、常见的四种数值运算实现方式
#   (())、let、expr、bc

# 2、工作效率比较
#   (()) == let > expr > bc
#   (())和let是bash内建命令，执行效率高；而expr和bc是系统命令，会消耗内存，执行效率低。
#   (())、let和expr只支持整数运算，不支持浮点运算；而bc支持浮点运算

echo "*************************************数值运算********************************************"

# 3、应用示例1: 分别用上面四种方式实现"3*(5+2)"。
val=$((3*(5+2)))
echo "(())  val = $val"

let "val=3*(5+2)"
echo "let  val = $val"

val=`expr 3 \* \( 5 + 2 \)`
echo "expr  val = $val"

val=`echo "3*(5+2)"|bc`
echo "bc  val = $val"

# 应用示例二：分别勇上面四种方式实现“数值+1”。
val=0

((val++))
echo "(())  val = $val"

let "val++"
echo "let  val = $val"

val=`expr $val + 1`
echo "expr  val = $val"

val=`echo "$val + 1"|bc`
echo "bc  val = $val"

# 应用示例三：计算1/3,保留3位小数。

val=`echo "scale=3; 1/3"|bc`
echo "bc  val = $val"


#######################################################################################################

# 注意
:||{
    此为多行注释符号, 下面使用这个
}
############################

:||{

十二、字符运算

1、字符串定义: 例如str=${var},下面几种变体
    字符串定义                    定义说明
    ${var}                     var的值,与$var相同
    ${var-default}             如果var没有被声明，那么就以default作为传回值
    ${var:-default}            如果var没有被声明，或者其值为空，那么就以default作为传回值
    ${var=default}             如果var没有被声明，那么就以default作为传回值,同时将$var 赋值为default
    ${var:=default}            如果var没有被声明，或者其值为空，那么就以default作为传回值,同时将$var 赋值为default
    ${var+other}               如果var声明了，那么就以other作为传回值, 否则null作为传回值
    ${var:+other}              如果var为非空值，那么就以other作为传回值, 否则null作为传回值
    ${var?ERR_MSG}             如果var没有被声明，那么就打印ERR_MSG
    ${var:?ERR_MSG}            如果var为空值，    那么就打印ERR_MSG


2、字符串操作
    string操作                                操作说明
    ${#string}                            string 的长度
    ${string:pos}                         在string中,,从pos位置提取string的子串
    ${string:pos:length}                  在string中,,从pos位置提取长度为length的string的子串
    ${string#substring}                   从变量$string的开头，删除最短匹配substring的子串
    ${string##substring}                  从变量$string的开头，删除最长匹配substring的子串
    ${string%substring}                   从变量$string的结尾，删除最短匹配substring的子串
    ${string%%substring}                  从变量$string的结尾，删除最长匹配substring的子串
    ${string/substring/repalce}           使用replace 来代替第一个匹配的substring
    ${string//substring/replace}          使用replace 来代替所有匹配的substring
    ${string/#substring/replace}          如果$string 的前缀匹配substring，那么使用replace来代替substring
    ${string/%substring/replace}          如果$string 的后缀匹配substring，那么使用replace来代替substring

}



# 3、应用示例

echo "*************************************string********************************************"

path="/dir1/dir2/dir3/my.file.txt"

echo -n "path length: "
echo ${#path}


echo -n "file: "
echo ${path:16}

echo ${path:16:7}

echo ${path#*/}
echo ${path##*/}

echo ${path#*.}
echo ${path##*.}

echo ${path%/*}
echo ${path%%/*}

echo ${path%.*}
echo ${path%%.*}

echo ${path/dir/replace}
echo ${path//dir/replace}

echo ${path/#"/dir1"/"replace"}
echo ${path/%".txt"/".sh"}


echo ${path/"dir2/"/}


########################################################################################


:||{

十三、bash 自带参数

    参数                              参数说明
    $?                    函数的返回值或程序在shell中退出的情况，正常退出返回0，否则非0
    $#                        代表后接参数的个数
    $@                      代表全部变量。如 ["$1" "$2" "$3" "$4"],每个变量独立的
    $*                      代表全部变量。如 ["$1 $2 $3 $3"]
    $-                      在shell启动或使用set命令时提供选项
    $$                      当前shell的进程号
    $!                      上一个子进程的进程号
    $0                      当前shell名
    $n                   位置参数值，n表示位置，n > 0, 如 $1 表示第一个参数
}





##########################################################################################

:||{

十四、bash 调试

1、bash 命令

    使用方法：bash [-nvx] scripts.sh
    说明：
        -n: 不要执行 script,仅查询语法的问题;
        -v: 再执行 sccript 前,先将 scripts 的内容输出到屏幕上;
        -x: 将使用到的 script 内容显示到屏幕上,这是很有用的参数!


例如，想要执行bash脚本，并查看bash的调用流程，可以通过以下命令：
bash -x yourscript.sh


2、echo 命令

    使用方法：echo [option] string
    说明：
        -n : 输出内容之后，不换行。默认是输入内容之后，换行。
        -e : 开启反斜线“\”转义功能

3、printf 命令

    和echo一样，printf也能用于输出。语法格式和C语言中printf一样。

}



###########################################################################################

:||{

十五、bash内建指令

1、内建命令查看方法
    基本格式
        type cmd
    格式说明
        type是命令关键字，cmd表示查看的命令；若输出builtin，则该命令是bash的内建命令。

    例如:
        type echo

除此之外，用户也可以通过man bash或者man builtins查看bash的全部内置命令.


2、常用内建命令说明
    2.1 echo
        命令：echo arg
        功能：在屏幕上显示出由arg指定的字串
    2.2 read
        命令格式：read 变量名表
        功能：从标准输入设备读入一行，分解成若干字，赋值给bash程序内部定义的变量
    2.3 shift
        命令：shift [N] N为大于0的整数；当N省略时，等价与于“shift 1”
        功能：所有的参数依次向左移动N个位置，并使用$#减少N，直到$#=0为止。
    2.4 alias
        命令：alias name='value'
        功能：别名。用name替换value，value要用单引号括住。
    2.5 export
        命令：export变量名[=变量值]
        功能：export可以把bash的变量向下带入子bash, 即子bash中可以使用父bash的变量，
            从而让子进程继承父进程中的环境变量。但子bash不能用export把它的变量向上带入父bash。
    2.6 readonly
        命令：readonly 变量名
        功能：定义只读变量。不带任何参数的readonly命令将显示出所有只读变量。
    2.7 exec
        命令：exec 命令参数
        功能：当bash执行到exec语句时，不会去创建新的子进程，而是转去执行指定的命令，
            当指定的命令执行完时，该进程（也就是最初的bash）就终止了，所以bash程序中exec后面的语句将不再被执行。
    2.8 "."（点）
        命令：. bash程序文件名
        功能：使bash读入指定的bash程序文件并依次执行文件中的所有语句。
    2.9 exit
        命令：exit N
        功能：退出Shell程序。在exit之后可有选择地指定一个数位作为返回状态。


}




###############################################################################################################
#                                          bash 基础部分结束                                                  #
###############################################################################################################




###############################################################################################################
#                                             bash 高级部分                                                   #
###############################################################################################################

:||{

一、awk 工具

1、awk环境变量

    变量                             描述
    $n                          当前记录的第n个字段，字段间有FS分割
    $0                           完整的输入记录
    ARGC                        命令行参数的数量
    ARGCIND                     命令行中当前文件的位置（从0开始算）
    ARGV                        包含命令行参数的数组
    CONVFMT                     数字转换格式（默认值为%.6g）
    ENVIRON                     环境变量关联数组
    ERRNO                       最后一个系统错误的描述
    FIELDWIDTHS                 字段宽度列表（用空格键分割）
    FILENAME                    当前文件名
    FNR                         同NR,但相对于当前文件
    FS                          字段分隔符（默认是任何空格）
    IGNORECASE                  如果为真,进行忽略大小写的匹配
    NF                          当前记录的字段数
    NR                          当前记录数
    OFMT                        数字的输出格式（默认值是%.6g）
    OFS                         输出字段分隔符（默认是一个空格）
    ORS                         输出记录分隔符（默认是一个换行符）
    RLENGRH                     由match函数所匹配的字符串的长度
    RS                          记录分隔符（默认是一个换行符）
    RSTART                      有match函数所匹配的字符串的第一个位置
    SUBSEP                      数组下标分隔符（默认值是\034）


2、awk条件操作符

    符号                           描述
    <                              小于
    <=                             小于等于
    ==                              等于
    !=                             不等于
    >=                             大于等于
    >                              大于
    ~                              匹配正则表达式
    !~                             不匹配正则表达式


3、awk字符串操作

    字符串操作                        描述
#   gsub(r,s)                       在整个$0中用s代替r
#   gsub(r,s,t)                     在这个t中用s替代r
#   index(s,t)                      返回s在字符串t的第一个位置
#   length(s)                       返回s的长度
#   match(s,r)                      测试s是否包含匹配r的字符串
#   split(s,a,fs)                   在fs上将s分成序列a
#   sprint(fmt, exp)                返回经fmt格式化的exp
#   sub(r,s)
#   substr(s,p)                     返回字符串 s中从p开始的后缀部分
#   substr(s,p,n)                   返回字符串 s中从p开始长度为n的后缀部分

4、正则表达式常用类

    正则表达式缩写类                 描述
      [[:upper:]]                     [A-Z]
      [[:lower:]]                     [a-z]
      [[:digit:]]                     [0-9]
      [[:alnum:]]                    [0-9a-zA-Z]
      [[:space:]]                    空格或tab键
      [[:alpha:]]                    [a-zA-Z]
}


# 应用示例

# 1、输出文件全部文本
awk '{print $0}' test.txt

# 2、输出 'ls -l' 的权限和文件名（即每条记录的第一个字段和第九个字段）
ls -l | awk '{printf("%s  %s\n", $1, $9)}'
# 提示 printf：输出指令。它的使用方法和C语言中printf的使用方法一样

# 3、在上一题的基础上添加功能：第一，输出每一行的行号和该行所包括的域的总数。第二，第1行和最后一行输出提示语
ls -l | awk 'BEGIN{printf("-----begin-----\n")} {printf("%d fileds-%d  %s  %s\n", NR, NF, $1, $9)} END{printf("-----end-----\n")}'
# 说明 BEGI: 表示在文本进行操作之前进行的工作。
#      END:  表示在对文本的所有行都处理完毕之后前进行的工作。
# 提示 在awk中，请尽量使用{}来进行区分指令段，{}可以嵌套使用！这样做的好处写出的脚本不容易出错，而且可读性更强！

# 4、输出"ls -l"中文件(夹)名字包括数字的完整信息
ls -l | awk '{if($9 ~ /[[:digit:]]/) print $0}'
# 说明  $9 ~ /[[:digit:]]/ : 表示能够匹配数字的“第一行的第9段”。

# 5、 输出"ls -l"中非文件夹的完整信息
ls -l | awk '{if($1 !~ /^d/) print $0}'
# 说明  ^d:以d开头的。^表示起始位. 此外, $表示结束位.如d$,表示以d结尾的。

# 6、找到"ls -l"中文件(夹)名字的长度大于10的行，然后输出其完整信息
ls -l | awk '{if(length($9) > 10) print $0}'

# 7、给一个文件每行开头添加行号
awk '{printf("%03d %s\n", NR, $0)}' input.txt > output.txt

# 8、打印文件内字段数大于3的行的总数
awk 'BEGIN{count=0}; {if(NF > 3) count++}; END{printf("count = %d\n", count)}' in.txt

# 9、将文本中的各行合并一行，中间用“|”分割
awk 'BEGIN{ORS="|"}; {print $0}; END{printf("\n")}' in.txt > out.txt
# 说明: ORS 表示输出记录分隔符,默认为换行符

# 10、将文本中空格换成换行符
awk 'BEGIN{FS=" "; OFS="\n"}; {i=0; while(++i <= NF) print $i}; END{printf("\n")}' in.txt > out.txt
# 说明: FS 表示字段分隔符，默认空格; OFS 表示输出字段分隔符，默认空格


###############################################################################################################


















echo "未完待续..."

