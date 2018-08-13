<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>员工界面</title>
<%
	boolean flag = (session.getAttribute("empIsLogin") == null
			|| !session.getAttribute("empIsLogin").equals("true"));
	if (flag) {
		response.sendRedirect("../emppage/emplogin.jsp");
	}
	pageContext.setAttribute("APP_PATH", request.getContextPath());
	String empName = (String) session.getAttribute("empName");
	System.out.println(session.getAttribute("empIsLogin"));
%>
<%--引入jQuery--%>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
<!-- 引入bootstrap样式 -->
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<STYLE type="text/css">
.in-line {
	display: inline-block;
}
</STYLE>
</head>
<body>
	<!-- 导航条 -->
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><%=empName%></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active" id="link1"><a href="javascript:link1()">部门动态(link1)</a></li>
				<li id="link2"><a href="javascript:link2();">技术好文(link2)</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">更多 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="http://www.yuntiy.com/">科技头条</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="EmpInfo.jsp">个人信息</a></li>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:logout();">退出登录</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="col-lg-8 news-detail">
		<h1>面对史上最严数据保护法案，「重灾区」在何处？中国科技企业又该如何应对？</h1>
		<p class="meta">
			<span><i class="glyphicon glyphicon-home"></i>极客公园</span> <span><i
				class="glyphicon glyphicon-user"></i>四月</span> <span><i
				class="glyphicon glyphicon-time"></i>2018-05-30</span> <span><i
				class="glyphicon glyphicon-list-alt"></i> GDPR 欧盟 数据隐私 用户数据保护 </span>
		</p>
		<div class="news-content">
			<p>
				上周，布鲁塞尔的欧洲议会室里弥漫着草木皆兵的紧张氛围，扎克伯格开始接受新一轮的盘问——这次是欧盟机构。三天后，欧盟个人资产保护新法
				GDPR (General Data Protection Regulation)
				正式上路，扎克伯克的「微笑战术」将不再管用。&nbsp;<br>
			</p>
			<p>这部欧盟「史上最严」数据保护法案在 5 月 25
				日正式生效，因其适用范围最广、定责条例最严、处罚金额最昂贵的「三最」引起各方的高度关注。「GDPR
				为未来十年的全球数据保护定下了基础，它几乎对科技公司用个人数据来赚钱的所有环节进行了规定和限制。」《连线》杂志对其评价。&nbsp;</p>
			<p>GDPR
				对个人资产的定义进行了非常广泛地覆盖，「除个人电话号码、地址、健康资料、电子信箱等之外，像是指纹、人脸识别、视网膜扫描、线上辨识码以及线上定位资料，如
				Cookie、IP 位置、行动装置 ID 等，全都纳入个资范畴。」安侯法律事务所执行顾问翁士杰分析道。</p>
			<p>就影响范围而言，GDPR
				不仅适用在欧盟设立子公司或分公司的企业，也适用所有有处理欧盟居民个资的欧盟境外企业。这意味着，企业规模无论大小，横跨服务、科技、制造、金融产业，都无可避免会受到影响。&nbsp;</p>
			<p>作为全球第三大经济体，希望打开全球市场的企业想要绕开欧盟几乎不可能。只要企业有电脑系统、伺服器及员工使用手机，都可能触及
				GDPR 规范，其中无法预测的不确定性终究成为风险。&nbsp;</p>
			<h2>靴子落地：闪转腾挪还是直面应对？</h2>
			<div class="image-desc" style="text-align: center; color: #333;">
				<img class="uploaded-img"
					src="http://img.yuntiy.com/illustration/1527619099347.jpg"
					max-width="100%" width="auto" height="auto">
			</div>
			<p>
				从 2016
				年至今，欧盟已经预留了足足两年的时间给相关企业进行过渡和调整。但如今，当真金白银的罚款数额公布后，很多公司还是一片手忙脚乱。&nbsp;<br>
			</p>
			<p>调查显示，大部分企业可能还没有做好准备。为避免违规风险，一些企业只能选择在欧洲暂停访问更为安全，至少目前是这样。&nbsp;</p>
			<p>根据数据分析公司 SAS 的调研，全球仅有不到一半的企业（49%）表示他们能按期达到 GDPR
				的合规要求。不少小公司由于缺乏资源和指导，仍然处于观望状态。直接营销协会（DMA）研究也发现，只有 15％的营销人员相信他们的业务符合
				GDPR。&nbsp;</p>
			<p>果不其然，法案生效的第一天，Facebook 和谷歌便遭到了起诉。&nbsp;</p>
			<p>奥地利运动人士Max Schrems以违法运作为由，分别对谷歌（Google）的安卓系统、脸书（Facebook）及其旗下的
				Instagram（IG）和 WhatsApp 的子公司提起诉讼，一共是四起。&nbsp;</p>
			<p>在诉状中，施伦斯表示，这种只能「接受或拉倒」的方式，违反 GDPR 让民众可自由选择是否允许企业使用他们的个资。&nbsp;</p>
			<p>诉讼要求法国、比利时、德国和奥地利的监管机构对这几家公司进行罚款。根据 GDPR 的规定，违反该法律的公司将面临最高
				2000 万欧元或全球年度营业额 4% 的罚款（两者取其高）。&nbsp;</p>
			<p>按此规则计算，若欧洲的监管机构定性成违法，谷歌的母公司 Alphabet 最高将面临 37 亿欧元罚款，Facebook
				及其两家子公司 WhatsApp 和 Instagram 分别最高面临 13 亿欧元罚款，其金额逼近反垄断法的处罚力度。&nbsp;</p>
			<p>此前，业界估计欧盟一年内收到的罚金可能达到 60 亿美金（51 亿欧元）。现在看来，这个数字很可能被低估了。&nbsp;</p>
			<p>隐私维权人士愤愤不平提起诉讼，数据保护监管机构也正准备挥起执法大棒。&nbsp;</p>
			<p>欧盟最高隐私监管负责人本周警告称，可能会很快有企业遭到处罚。新上任的的欧洲信息保护委员会 (European Data
				Protection Board) 负责人 Andrea Jelinek 表示：可以肯定的是，这跟本不用等到几个月之后。&nbsp;</p>
			<p>人心惶惶的不只有国际巨头，中国厂商的动作和回应也变得积极起来。&nbsp;</p>
			<p>今年 4 月份，QQ
				国际版就已经在欧洲暂停运作。公告显示，欧洲地区将在升级到下一个版本之后才能恢复使用，但并未就具体上线时间做出说明。&nbsp;</p>
			<p>「早在 2014 年，小米就成立了隐私委员会，和官方认证机构展开隐私保护相关业务。到 2016 年，MIUI
				操作系统和小米网的国内版和国际版都得到了 TRUSTe
				隐私认证。」小米首席架构师、人工智能与云平台副总裁崔宝秋博士在接受第一财经采访时表示。&nbsp;</p>
			<p>尽管如此，小米旗下生态链企业的小米智能灯（YeeLight）还是因为无法及时符合 GDPR
				法规而被迫关闭服务。当智慧灯炮一秒退化成普通灯泡，有人怀疑是因为该电灯会记录使用者的开关灯纪录。&nbsp;</p>
			<p>Yeelight CEO 姜兆宁则在回复中否认了此行为，并表示关闭数据服务是基于 GDPR 对于非欧盟地区公司的 API
				测试规定所致，只是暂时下线。&nbsp;</p>
			<p>这让问题开始线聚焦在物联网企业在数据搜集的合规性上，其中可能涉及到智能家居、智能机器人、无人机、智能穿戴等一众中国创业公司。&nbsp;</p>
			<p>「大疆在欧洲市场的一切运行正常。我们和数据打交道，但我们并不会涉及到数据隐私或者「个人数据」」大疆公关总监谢阗地向极客公园表示，「数据处理都在本地进行。」&nbsp;</p>
			<p>而事实上，去年大疆曾受到美国陆军（US
				Army）关于「网络安全漏洞」的指控，还一度要求各部门停用大疆无人机。随后，由美国国家海洋和大气管理局 (NOAA)
				出具的数据安全报告，确认大疆无人机在飞行途中没有收集任何数据，才得以让指控平息。&nbsp;</p>
			<p>在这个案例中，大疆主要通过第三方的数据机构来调查证明企业的数据安全问题。&nbsp;</p>
			<p>目前，为配合低空飞行监管，所属美国和中国地区的无人机用户已经强制实行实名认证。面向欧洲市场，大疆方面表示，实名制的执行将根据每个国家甚至国家里不同省份地区的要求确定，大疆主要以配合为主。&nbsp;</p>
			<p>对于用户的飞行轨迹等数据，大疆方面回应，除非是用户主动提交做飞行分析，否则不会触碰该类数据。凭借多年的海外市场实战经验，大疆在面向比国内更为严苛的市场环境时显得更加自如。&nbsp;</p>
			<p>在极客公园与优必选、出门问问等相对更为年轻的创业公司就如何应对 GDPR
				进行交流时，他们的应对策略和态度更为积极和主动——主要采取多管齐下的方式，包括从设计流程，业务运营以及关键硬件等三个方面入手。&nbsp;</p>
			<p>首先，为了应对 GDPR 更为严苛的新规，公司在运营层面都迅速成立了专题项目组，包括由专门高管担任
				DPO（数据保护官员），同时加强相关人员的教育，提高数据保护意识。&nbsp;</p>
			<p>在 GDPR 的细则中已经提到，相关公司必须设立 DPO
				岗位。如果组织是公共机构，正在进行需要定期或系统监控的加工业务，或者有大规模的加工活动时，这点更加重要。&nbsp;</p>
			<p>在产品设计流程层面，出门问问 CEO
				李志飞向极客公园表示，公司已经从数据加密、脱敏及分类分级管理上开展了相应措施。在产品设计上需要进行特定优化，以保证用户可以去实现
				GDPR 要求的用户权利比如删除、更正用户信息、撤回同意等。</p>
			<p>谈到 DGPR 落地后对于公司在欧洲市场的影响，优必选 CEO
				周剑对极客公园表示，「在合作伙伴的筛选过程中将更加严格，要求合作伙伴在涉及到相关条例时也必须合规。」&nbsp;</p>
			<p>合作伙伴的调整必将在一定程度上影响原有的市场推进效率，周剑认为，这是实施全球化战略必须要经历的。&nbsp;</p>
			<p>「GDPR 对公司在欧洲市场的运营一定会有影响，」李志飞介绍道，比如原来的 opt-out 需要变成 opt-in
				模式；对用户权利的保护上更加全面了，比如说需要提供通道给用户删除其信息以实现 GDPR 的被遗忘权。&nbsp;</p>
			<p>根据业内不具名的人士分析，在涉及到物联网、互联网这种本身存在数据生意的领域，使用一些通用协议的厂商需要等待更新。而使用私有协议，或者说自主技术的公司则不会有太多影响。即便有确实需要调整的，调整自己的协议也很快的。&nbsp;</p>
			<p>对于准备积极投身全球市场的互联网企业而言，国内过于野蛮生长的市场环境和「中国式」的快节奏发展实际上掩盖了很多问题和漏洞。&nbsp;</p>
			<p>「像是以前国内软件厂商推行的全民开机时间
				PK，在欧洲是不可想象的，因为那完全涉及到个人隐私。国内很多博噱头的运营方式在欧盟新规下就未必合适了。」&nbsp;</p>
			<p>可以说，GDPR
				对数据隐私的部分保护条款甚至有违背我们的「常理」，而这又是出海企业不得不面对的问题，否则只能放弃欧盟市场，所以才更值得企业的领导层面以及产品业务的设计者重视和学习。&nbsp;</p>
			<h2>「重灾区」</h2>
			<div class="image-desc" style="text-align: center; color: #333;">
				<img class="uploaded-img"
					src="http://img.yuntiy.com/illustration/1527619107394.jpg"
					max-width="100%" width="auto" height="auto">
			</div>
			<p class="image-1527574755435"></p>
			<p></p>
			<p class="image-1527574463396"></p>
			<p class="image-1527574303860"></p>
			<p>更新后的 GDPR 法案长达 91 个条文，共 204
				页，我们很难在此一一赘述。参考专业人士分析，前中国移动业务支撑系统部经理、通信行业老兵宁宇在其个人主页上的分析，GDPR
				影响最为重要的约束包括两个方面：&nbsp;</p>
			<p>
				<span style="font-weight: bold;">其一，根据 GDPR
					的要求，处理个人数据必须要有合法理由和方式，而对于"合法"的定义非常严苛。&nbsp;</span>
			</p>
			<p>除了拓宽「个人数据」的范围、并将高度保护个人隐私的「数据可携权」和「被遗忘权」明确写入法条之外，GDPR
				还强调了数据保护要由「属地」向「属人」转变。&nbsp;</p>
			<p>这意味着，条例的适用范围不再局限于欧盟境内，任何企业只要向欧盟市场提供商品服务，收集或处理个人数据，都受到管辖。无疑，这对从事数据收集和处理的企业及其产业链，都提出了极高的要求。&nbsp;</p>
			<p>
				<span style="font-weight: bold;">其二，GDPR
					中明确定义了数据主体的权利，在为个人有效行使权利提供法律保障的同时，也对企业处理和使用数据提出了苛刻的要求。&nbsp;</span>
			</p>
			<p>这意味着，那些拿客户数据打标签做画像的创业，将被要求公开其基本算法逻辑和运算结果！</p>
			<p>除此之外，目前热门的大数据分析公司，因个资保护范围更广，想运用 AI 工具做资料分析的运作空间，也将大大缩水。</p>
			<p>为此，来自剑桥和伦敦大学学院的创业团队 MediaGamm
				则给出一条不错的思路模型。这是一家在线用户行为预测公司，基于特定的算法对广告技术公司的竞价算法进行优化，帮助广告主深度挖掘媒体数据，进而优化广告投放方案。</p>
			<p>MediaGamm CEO Rael Cline 在接受采访时表示，「我们必须做出改变以确保能遵守
				GDPR，其中包括限制我们持有授权数据的时间，以及确保在客户要求删除特定记录时能够应答。」</p>
			<p>Rael Cline 还也提到了应用 Look-a-like
				相似人群扩展的方式来提升用户精度，与此同时，降低对于用户基数的要求。这和当下提倡的小规模数据模型很相似。</p>
			<p>例如，在线广告行业中，随着同意（企业新隐私条款）的用户数量的减少，可以应用人工智能来对这些已同意的用户的行为进行建模，然后根据共享属性找到相似的用户。</p>
			<p>在云服务层面，云计算倡导多层次连接和互用组合的理念与 GDPR 的「有迹可循」要求存在着不可调和的矛盾。</p>
			<p>GDPR
				对数据的控制者和处理者都提出了同样的要求，共同承担起数据安全保护的责任，但这同时涉及到云服务的提供商和云计算的客户两个环节的权益。
				数据的流通和空间的共享等复杂多线程问题究竟该取得哪些人的同意还很难说清楚。&nbsp;</p>
			<p>一名英特尔的顾问忧心忡忡地指出，欧盟的 GDPR 主要用来限制个人资料使用，却没有建立一套规则协助重度使用资料的公司运作。</p>
			<p>就当下而言，最为重要的是还是为用户争取到最基本的删除权、知情权等。&nbsp;</p>
			<p>阿里云表示，其产品规划中遵从默认隐私设计（Privacy by
				Design）规范，已提供帐号删除功能，全球客户可以自助操作完成。所有新发表的云产品上线之前，也都通过安全与隐私设计的双重评估。&nbsp;</p>
			<p>微软透露，已经为 GDPR 项目投入 1600 多名工程师，他们将为全球客户提供正在为欧洲建设的符合 GDPR
				的工具，微软的客户可以查看、删除和移动他们的个人数据。&nbsp;</p>
			<h2>数据「严法」的下一站：不止于欧盟</h2>
			<div class="image-desc" style="text-align: center; color: #333;">
				<img class="uploaded-img"
					src="http://img.yuntiy.com/illustration/1527619114437.jpg"
					max-width="100%" width="auto" height="auto">
			</div>
			<p>
				GDPR（《通用数据条例》）的原型最早可以追溯到 1995 年欧盟颁布的《欧盟数据保护指令》。&nbsp;<br>
			</p>
			<p>正是由于当下的网络环境与 1995 年的法案建立时已经截然不同，所以在《欧洲一般隐私指令》颁布的 20
				年后，《一般数据保护条例》予以制定。欧盟通过单行法（GDPR）来覆盖各行各业的个人信息处理行为，在日益增长的数据驱动时代下，相较于保护个人数据更为重要的是彰显保护基本人权的理念。&nbsp;</p>
			<p>事实上，欧盟之后再立数据严法的潜在地区已经可以想象。「这部法案不仅对于北美，对于亚洲、海湾阿拉伯地区的数据保护都有参考意义。」业内人士向极客公园分析道。&nbsp;</p>
			<p>在扎克伯克现身美国国会接受数据泄露丑闻事件质询时，民主党领袖 Frank Pallone
				就曾建议，「我们需要全面的隐私和数据安全立法」，作为在社交网络上出现外国干扰时，「保护我们的民主」的步骤，国会议员们也反复提及
				GDPR。&nbsp;</p>
			<p>有分析人士认为，欧盟过去订出的环保标准最终成为全球标准，如今迈入物联网时代，大数据分析传输已经无可避免，面对这项号称史上最严格的资料保护令，企业要有心理准备，GDPR
				非常有可能成为资料保护的全球通用标准。&nbsp;</p>
			<p>出门问问李志飞及其法务则提到，在通用性数据保护方案的普及问题上，还需要注意到国家层面的数据战略方向。&nbsp;</p>
			<p>他们表示，欧洲与美国对于数据/隐私保护与科技发展的思维是不一样的，以人工智能为例，全球都处于发展人工智能的浪潮中，欧洲采取人工智能法律和伦理规则先行，已经试图用正确的价值观来约束技术开发与应用。&nbsp;</p>
			<p>而美国仅在人工智能有法律提案时，更多涉及如何促进技术创新应用，进行事后监管加自律，以最佳实践来回应各种挑战，最后立法。GDPR
				对个人隐私的保护力度之全面，应当是有标杆作用的，但各国是否会完全按照欧盟的做法来参照，这点是不一定的，还要具体取决于国家对数据保护的战略性方向。&nbsp;</p>
			<p>但是数据的流通性必然涉及国家间的数据跨境流动，这一定会对北美甚至全球都带来一定的影响，也会为其他国家改善监管思路与数据立法起到一定的参考意义。&nbsp;</p>
			<h2>「单挑」黑盒子</h2>
			<div class="image-desc" style="text-align: center; color: #333;">
				<img class="uploaded-img"
					src="http://img.yuntiy.com/illustration/1527619122465.jpg"
					max-width="100%" width="auto" height="auto">
			</div>
			<p>
				在 GDPR 数据法案落地的同时，也激起了学术界的热烈讨论。GDPR
				一项关于强调「透明处理原则」的条例，近乎将深度学习算法推上了被告席的位置。&nbsp;<br>
			</p>
			<p>今年初，华盛顿大学计算机科学与工程学教授 Pedro Domingos 就曾在 Twitter 上说道，GDPR
				要求算法有可解释性，这让深度学习成了违法行为！&nbsp;</p>
			<p>在 GDPR
				的条例中明确表示，针对「个人化自动决策」赋予用户请求解释、拒绝适用的权利，换句话说，就是将近年来学术讨论逐渐热络的「可信任／解释的人工智能」直接纳入法律，试图引起全面性的重视。&nbsp;</p>
			<p>但实际上，机器学习，尤其深度学习，有如在黑盒子内进行的过程，就像人类的神经网路，究竟如何决定数据的关联性与权重以形成决策，向来是个难解的谜团。&nbsp;</p>
			<p>为此，企业至少需要有能力在足以保护用户权益的范围内，简要说明怎样的数据会导致怎样的决策、数据的变动如何影响决策的变动，并赋予用户可以拒绝适用、表达意见、介入判断的权利。&nbsp;</p>
			<p>举例来说，如果线上个人保险业务完全透过算法，自动决定用户的保费金额，企业必须能够说明如何计算保费高低？是由哪些因素所决定？例如，是受到用户年龄、健康状况、驾驶习惯、肇事纪录等因素影响。而如果用户认为权益受损，则可以表示异议。&nbsp;</p>
			<p>但同时也有分析人士指出，这可能加重算法中作弊的可能。&nbsp;</p>
			<p>另一方面，最小限度利用个人数据原则的提出，为企业在数据层面的评判和算法能力提出了更高要求。「即使在大数据条件下，小部分人删掉数据之后，用小数据也要能够学会大智慧。」微软首席语音科学家、IEEE/ACM
				双科院士黄学东向极客公园表示。&nbsp;</p>
			<p>而边缘处理方案则避免了数据交叉使用的可能。如今，苹果、华为等手机巨头厂商纷纷推出自研芯片，正在试图将此前在「云端」处理的操作转移到设备端的本地完成。</p>
			<p>华为欧洲西部分公司首席营销官 Andrew Garrihy 接受采访时表示，移动 AI 让我们能够在设备中执行大量 AI
				计算和智能。这意味着非常敏感的个人数据将不再需要去云端。专用芯片可能成为一种帮助消费者控制自己的数据结束位置的工具。</p>
			<p>在物联网和人工智能时代，数据的强劲动力——「数据就是新的石油」的认知被越来越多人接受，但与此同时，我们无法对于数据滥用和违规的问题熟视无睹，为规整步伐而降低速度的做法将成为政府的折中选择。&nbsp;</p>
			<p>为迈过这段过渡期，献上明日法律事务所主持律师王琍莹的锦囊一副——「兼顾天平的两端，在策略方向上，必须掌握数据作为商业竞争的致胜关键，而在执行层面，仍应落实个人资料归个人控制的原则，不能偏废。」</p>
		</div>
	</div>
	<script type="text/javascript">
		function logout() {
			window.location.href = "../emppage/emplogout.jsp";
		}

		function link1() {
			$("#link1").addClass("active");
			$("#link2").removeClass("active");
			window.location.href = "../emppage/DeptNews.jsp";
		}

		function link2() {
			$("#link2").addClass("active");
			$("#link1").removeClass("active");
			window.location.href = "../emppage/SkillNews.jsp";
		}
	</script>
</body>
</html>