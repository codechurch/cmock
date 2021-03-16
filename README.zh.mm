<map version="0.9.0">

<node COLOR="#000000">
<font NAME="SansSerif" SIZE="20"/>
<richcontent TYPE="NODE">
<html>
<head>
</head>
<body>
<p>CMOCK
</p>
</body>
</html>
</richcontent>
<node COLOR="#0033ff" ID="sec-1" POSITION="right" FOLDED="true">
<font NAME="SansSerif" SIZE="18"/>
<edge STYLE="sharp_bezier" WIDTH="8"/>

<richcontent TYPE="NODE">
<html>
<head>
</head>
<body>
<p>简介
</p>
</body>
</html>
</richcontent>
<richcontent TYPE="NOTE">
<html>
<head>
</head>
<body>
<p>
cmock是一款专门提供给C语言使用的MOCK工具。<br  />
相比于业内其他的MOCK，cmock的特殊之处在于，实现了MOCK和调用static函数的机制。<br  />
cmock现在可以工作在AMD64的GNU/Linux环境。运行cmock，需要在系统中安装perl、objdump和gcc(x86_64-linux)。如果你使用Debian，其中objdump在binutils包中提供。<br  />
cmock也额外实现了简单的单元测试函数。<br  />
</p>
</body>
</html>
</richcontent>
</node>


<node COLOR="#0033ff" ID="sec-2" POSITION="left" FOLDED="true">
<font NAME="SansSerif" SIZE="18"/>
<edge STYLE="sharp_bezier" WIDTH="8"/>

<richcontent TYPE="NODE">
<html>
<head>
</head>
<body>
<p>授权
</p>
</body>
</html>
</richcontent>
<richcontent TYPE="NOTE">
<html>
<head>
</head>
<body>
<p>
授权协议采用 GPLv3 。<br  />
</p>
</body>
</html>
</richcontent>
</node>


<node COLOR="#0033ff" ID="sec-3" POSITION="right" FOLDED="true">
<font NAME="SansSerif" SIZE="18"/>
<edge STYLE="sharp_bezier" WIDTH="8"/>

<richcontent TYPE="NODE">
<html>
<head>
</head>
<body>
<p>安装
</p>
</body>
</html>
</richcontent>
<richcontent TYPE="NOTE">
<html>
<head>
</head>
<body>
<p>
cmock是一个perl5程序。<br  />
将cmock复制到/usr/bin目录，再设置执行权限，即完成安装。<br  />
</p>
<div class="org-src-container">

<pre class="src src-sh">sudo cp cmock /usr/bin &amp;&amp; sudo chmod +x /usr/bin/cmock
</pre>
</div>
</body>
</html>
</richcontent>
</node>


<node COLOR="#0033ff" ID="sec-4" POSITION="left" FOLDED="true">
<font NAME="SansSerif" SIZE="18"/>
<edge STYLE="sharp_bezier" WIDTH="8"/>

<richcontent TYPE="NODE">
<html>
<head>
</head>
<body>
<p>用法
</p>
</body>
</html>
</richcontent>
<richcontent TYPE="NOTE">
<html>
<head>
</head>
<body>
<div class="org-src-container">

<pre class="src src-dummy">cmock &lt;Object File&gt;
</pre>
</div>
<p>
cmock对用户提供的目标文件&lt;base&gt;.o进行分析，生成&lt;base&gt;_cmock.h、&lt;base&gt;_cmock.c及&lt;base&gt;_cmock.lds文件。<br  />
在&lt;base&gt;_cmock.h提供了CMOCK宏，在&lt;base&gt;_cmock.c提供了cmock的函数实现，在&lt;base&gt;_cmock.lds提供了辅助的链接脚本。<br  />
</p>
</body>
</html>
</richcontent>
</node>


<node COLOR="#0033ff" ID="sec-5" POSITION="right" FOLDED="true">
<font NAME="SansSerif" SIZE="18"/>
<edge STYLE="sharp_bezier" WIDTH="8"/>

<richcontent TYPE="NODE">
<html>
<head>
</head>
<body>
<p>用例
</p>
</body>
</html>
</richcontent>
<richcontent TYPE="NOTE">
<html>
<head>
</head>
<body>
<p>
在附带的例子里，some.c是待测的C程序文件，test.c是单元测试程序文件。<br  />
在test.c里，应该：<br  />
</p>
<div class="org-src-container">

<pre class="src src-dummy">#include "some_cmock.h"
</pre>
</div>

<ul class="org-ul">
<li>第一步，编译some.c：<br  />
</li>
</ul>
<div class="org-src-container">

<pre class="src src-sh">gcc -c -g -Wall -fPIC -o some.o some.c
</pre>
</div>

<ul class="org-ul">
<li>第二步，使用cmock生成some_cmock.h、some_cmock.c和some_cmock.lds<br  />
</li>
</ul>
<div class="org-src-container">

<pre class="src src-sh">cmock some.o
</pre>
</div>

<ul class="org-ul">
<li>第三步，编译test.c和some_cmock.c<br  />
</li>
</ul>
<div class="org-src-container">

<pre class="src src-sh">gcc -c -g -Wall -fPIC -o test.o test.c 
gcc -c -g -Wall -fPIC -o some_cmock.o some_cmock.c
</pre>
</div>

<ul class="org-ul">
<li>第四步，链接所有，得到测试程序<br  />
</li>
</ul>
<div class="org-src-container">

<pre class="src src-sh">gcc -g -Wall -o test_some.out some.o some_cmock.o test.o \
	-ldl -lm              \
	-Wl,-T,some_cmock.lds \
	-Wl,--unresolved-symbols=ignore-all
</pre>
</div>
<p>
(&#x2013;unresolved-symbols 是可选的，取决于在test.c里的实现。)<br  />
</p>
</body>
</html>
</richcontent>
</node>


<node COLOR="#0033ff" ID="sec-6" POSITION="left" FOLDED="true">
<font NAME="SansSerif" SIZE="18"/>
<edge STYLE="sharp_bezier" WIDTH="8"/>

<richcontent TYPE="NODE">
<html>
<head>
</head>
<body>
<p>编程接口
</p>
</body>
</html>
</richcontent>
<richcontent TYPE="NOTE">
<html>
<head>
</head>
<body>
<ul class="org-ul">
<li>函数 void cmock_restore()<br  />
将当前MOCK的函数恢复为真实函数。<br  />
</li>

<li>宏 CMOCK_CALL(rt, func, args)<br  />
调用真实函数，此宏可用于调用static函数。<br  />
例：<br  />
</li>
</ul>
<div class="org-src-container">

<pre class="src src-C">int v = CMOCK_CALL(int, foobar, (3));
</pre>
</div>

<ul class="org-ul">
<li>宏 CMOCK_FUNC_VAL(func, val)<br  />
MOCK函数，设置函数返回固定值。<br  />
</li>
</ul>
<div class="org-src-container">

<pre class="src src-C">CMOCK_FUNC_VAL(foobar, 10);
</pre>
</div>

<ul class="org-ul">
<li>宏 CMOCK_FUNC(rt, func)<br  />
MOCK函数，提供函数体。<br  />
</li>
</ul>
<div class="org-src-container">

<pre class="src src-C">CMOCK_FUNC(int, foobar) (int a)
  {
	return a * 2;
  }
</pre>
</div>
</body>
</html>
</richcontent>
</node>


<node COLOR="#0033ff" ID="sec-7" POSITION="right" FOLDED="true">
<font NAME="SansSerif" SIZE="18"/>
<edge STYLE="sharp_bezier" WIDTH="8"/>

<richcontent TYPE="NODE">
<html>
<head>
</head>
<body>
<p>简单单元测试接口
</p>
</body>
</html>
</richcontent>
<richcontent TYPE="NOTE">
<html>
<head>
</head>
<body>
<ul class="org-ul">
<li>环境变量 V 控制附加信息输出，<br  />
</li>
</ul>
<div class="org-src-container">

<pre class="src src-sh">V=1 ./test_some.out
</pre>
</div>
<p>
将输出附加信息。<br  />
</p>

<ul class="org-ul">
<li>函数 int cmock_result()<br  />
获取整个测试程序的结果。<br  />
</li>

<li>宏 CMOCK_RESULT(expr)<br  />
设置当前测试用例的结果。<br  />
</li>

<li>宏 CMOCK_INFO(fmt, &#x2026;) 和 CMOCK_ERROR(fmt, &#x2026;)<br  />
打印信息，其中CMOCK_ERROR附带设置当前用例结果为0（错误）。<br  />
</li>

<li>宏 CMOCK_ASSERT(expr)<br  />
断言表达式为真。<br  />
</li>

<li>宏 CMOCK_CASE(name)<br  />
生成测试用例的函数头。<br  />
</li>

<li>宏 CMOCK_RUN_CASE(name)<br  />
运行一个测试用例。<br  />
</li>
</ul>
<div class="org-src-container">

<pre class="src src-C">CMOCK_CASE(some)
{
  ...
  CMOCK_RESULT(1);
}

CMOCK_CASE(other)
{
  if (foobar() == 0)
	CMOCK_INFO("foobar return OK");
  else               
	CMOCK_ERROR("foobar return error");
}

int main()
{
  CMOCK_RUN_CASE(some);
  CMOCK_RUN_CASE(other);
  return cmock_result();
}
</pre>
</div>
</body>
</html>
</richcontent>
</node>

</node>
</map>
