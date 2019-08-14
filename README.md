#uplatex 垂直排版的行間标点实验（縦書行間標點）

## 实现原理

通过`\leavevmode`下的`\kern`设置和`\raisebox`设置使标点符号偏离原来的位置，形成上下标标点符号。

## 具体实现

### 字符替换为命令式

利用 EmEditor 编辑器 将垂直标点替换为标点命令式。

` EmEditor 替换脚本.tsv` 格式保存为 utf16-le有签名。

```
on	，	\\dou{}		
on	。	\\gou{}		
on	、	\\dun{}		
on	：	\\mao{}		
on	︰	\\mao{}		
on	；	\\fen{}		
on	？	\\wen{}		
on	！	\\mtan{}		
on	〈	\\qsm{}		
on	〉	\\hsm{}		
on	「	\\qyh{}		
on	」	\\hyh{}		
on	『	\\xqyh{}		
on	』	\\xhyh{}		
on	〔	\\qqp{}		
on	〕	\\hqp{}		
on	......	……		
on	{}{	{		
on	{}\r\n	\r\n		
on	{}\\	\\		
```

### `main.tex ` 设定

```latex
\RequirePackage{plext}			%	縱組顓用
\RequirePackage{plautopatch}	%	為 pLaTeX 打補丁
\RequirePackage{multicol} %多欄
\RequirePackage{type1cm} %字體
\RequirePackage[uplatex,deluxe,jis2004]{otf} %字體包

\documentclass[a4paper]{utbook}
% \newcommand{\mc}{\mcfamily} % 如果提示mc未定义
% 居中标点 命名格式 \mxxx
\def\dou{\leavevmode\kern -.35zw \raise.6zh\hbox{\mc{・}}\kern -.15zw}
\def\dun{\leavevmode\kern -.35zw \raise.6zh\hbox{\mc{・}}\kern -.15zw}% 、
%\def\mgou{\leavevmode\kern -.35zw \raise.6zh\hbox{\mc{。}}\kern -.15zw}
% 非居中式标点
%\def\dou{\leavevmode\kern -.35zw \raise.3zh\hbox{\mc{，}}\kern -.15zw} %，
%\def\dun{\leavevmode\kern -.35zw \raise.3zh\hbox{\mc{、}}\kern -.15zw} % 、
\def\gou{\leavevmode\kern -.35zw \raise.3zh\hbox{\mc{。}}\kern -.15zw}
% 冒号、分号、叹号、问号替换为勾读。
\newcommand{\mao}{\dou}
\newcommand{\fen}{\gou}
\newcommand{\mtan}{\gou}
\newcommand{\wen}{\gou}
%前引号、后引号、书名号、曲牌名号。
\def\xqyh{\leavevmode\kern -.1zw\raise.1zh\hbox{\mc{『}}\kern-.1zw}
\def\xhyh{\leavevmode\kern-.05zw\raise-.1zh\hbox{\mc{』}}\kern -.1zw }
\def\qyh{\leavevmode\kern -.1zw\raise.1zh\hbox{\mc{「}}\kern-.1zw}
\def\hyh{\leavevmode\kern-.05zw\raise-.1zh\hbox{\mc{」}}\kern -.1zw }
\def\qsm{\leavevmode\kern -.1zw\hbox{\mc{〈}}}
\def\hsm{\leavevmode\hbox{\mc{〉}}\kern -.1zw}
\def\qqp{\leavevmode\kern -.1zw\hbox{\mc{〔}}}
\def\hqp{\leavevmode\hbox{\mc{〕}}\kern -.1zw}
\begin{document}
\mcfamily
\input{maintext.tex}	% 載入的正文文本。
\end{document}
```


关于上下划线、波浪线可以使用 `uline--.sty` 

命令式：

```latex
\RequirePackage{plext}			%	縱組顓用
\RequirePackage{plautopatch}	%	為 pLaTeX 打補丁
\documentclass[a4paper]{utbook}
\usepackage{uline--}	% 输出波浪线、下划线等
\begin{document}
\uline{下線} \mline{打消線} \oline{上線}\\
\udash{下破線} \mdash{打消破線} \odash{上破線}\\
\uwave{下波線} \mwave{打消波線} \owave{上波線}\\
\udotline{下点線} \mdotline{打消点線} \odotline{上点線}\\
\end{document}
```

另；输出上划线可以使用命令`\kasen{注内容}` 来为所注内容划线。（注意划线内无法换行，需要手动为他换行）

关于相邻线段的打断，在相邻命令之间加入水平间隔1mm即可：

```\kasen{河南}\hskip1mm\kasen{少室山}```


测试文件见附件。


