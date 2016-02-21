<?xml version="1.0" encoding="ISO-8859-1"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

		<head>
			<title>
				exponentialdecay.co.uk || beta
			</title>
		
			<link href="css/x.css" rel="stylesheet" type="text/css"></link>
		
		</head>

		<body class="overall" link="white" vlink="black" alink="white" onload="javascript:MailTo();">

			<script type="text/javascript">
			
				function MailTo()
				{
					var action = "mailto:";
					var user = "kontakt";
					var domain = "exponentialdecay.co.uk";
					var mailto = action + user + "@" + domain;
					document.getElementById("mail_to_link").href = mailto;
				}
				
			</script>

			<div class="content">
			
				<div class="d1">
					<img class="center" src="http://www.exponentialdecay.co.uk/images/mondrian.jpg" alt="yaced laitnenopxe"></img>
				 <br/>

					<p class="menupadding">
						<ul class="d1">
						<xsl:for-each select="page/section">
							<li class="d1">
								<a class="a1" href="javascript:void(null)">
									<xsl:value-of select="title"/>
								</a>
								&#160; &#160; &#160; &#160; 
							</li>
						</xsl:for-each>
						</ul>
					</p>
				</div>

				<div class="contentsright">

					<div class="d4" id="news">
						<br/>
						<h2 class="subtitles">
							news
						</h2>
						<xsl:for-each select="page/section/news/item">
						<xsl:sort select="timestamp" data-type="number" order="descending"/>
						<p class="content">
							<xsl:value-of select="date"/>
						</p>
						<p class="content">
							<xsl:value-of select="content"/><xsl:value-of select="sig"/>
						</p>
						</xsl:for-each>
					</div>
					
					<div class="d4" id="portfolio">
						<br></br> 
						<h2 class="subtitles">
							portfolio
						</h2>
						<xsl:for-each select="page/section/portfolio/project">
						<p>
							<a class="a2" target="_blank" href="http://www.exponentialdecay.co.uk/{location}">
								<xsl:value-of select="project_title"/>:
							</a>
							&#160;
							<xsl:value-of select="description"/>
						</p>
						</xsl:for-each>
						<table class="port-table">
							<tr>
								<td class="psc"></td>
								<td class="psc">
									<xsl:for-each select="page/section/portfolio/external_links">
										<a target="_blank" href="http://www.exponentialdecay.co.uk/{link}"><img class="psc" src="http://www.exponentialdecay.co.uk/{image}" alt="{page_title}"></img></a>
									</xsl:for-each>
								</td>
							</tr>
						</table>
						<br/>
					</div>
					
					<div class="d4" id="skills">
						<br/>
						<h2 class="subtitles">
							skills
						</h2>
						<p>
							<xsl:for-each select="page/section/skills/category">
								<xsl:value-of select="skill"/>:
								<br/>
								<xsl:value-of select="description"/>
								<br/>
							</xsl:for-each>
						</p>
					</div>
				
					<div class="d4" id="education">
					<br></br>
					<h2 class="subtitles">
						education
					</h2>
						<xsl:for-each select="page/section/education/school">
							<xsl:value-of select="name"/>
							<xsl:value-of select="dates"/>
							<br/>
							<xsl:for-each select="course">
								<xsl:value-of select="title"/>:
								<xsl:value-of select="grade"/><br/>
							</xsl:for-each>
						</xsl:for-each>
					</div>
						
					<div class="d4" id="interests">
						<br></br>
						<h2 class="subtitles">
							interests
						</h2>
						<xsl:value-of select="page/section/interests"/>
					</div>
						
					<div class="d4" id="gallery">
						<br></br>
						<h2 class="subtitles">
							gallery
						</h2>
						<xsl:for-each select="page/section/gallery">
							<a href="http://www.exponentialdecay.co.uk/{location}"><img class="gal" src="http://www.exponentialdecay.co.uk/{thumb}" alt="{alt}" width="60" height="60"></img></a>
						</xsl:for-each>
					</div>
											
					<div class="d4" id="books">
						<br></br>
						<h2 class="subtitles">
							books
						</h2>
						<xsl:for-each select="page/section/book">
							<a class="a4" target="_blank" href="{link}">
								<xsl:value-of select="title"/>
							</a>&#160;
						</xsl:for-each>
					</div>

					<div class="d4links" id="links">
						<br></br>
						<h2 class="subtitles">
							links
						</h2>
						<xsl:for-each select="page/section/links">
							<a class="a4" target="_blank" href="{link}">
								<xsl:value-of select="title"/>
							</a>&#160;
						</xsl:for-each>
					</div>
						
					<div class="d4" id="contact">
						<br></br>
						<h2 class="subtitles">
							contact
						</h2>
						<a class="a2" id="mail_to_link" href="">
							<xsl:value-of select="page/section/contact/text"/>
						</a>
						<br></br>
					</div>
	
					<div class="d4" id="playlist">
						<br></br>
						<h2 class="subtitles">
							playlist
						</h2>
						<a class="a1" href="javascript:void(null)">(virtual) [generated from entire winamp playlist]:</a>
						<br/><a class="a3" href="javascript:void(null)">01.black sabbath.iron man</a>
						<br/><a class="a1" href="javascript:void(null)">02.arctic monkeys.flourescent adolescent</a>
						<br/><a class="a3" href="javascript:void(null)">03.black light burns.iodine sky</a>
						<br/><a class="a1" href="javascript:void(null)">04.silversun pickups.melatonin</a>
						<br/><a class="a3" href="javascript:void(null)">05.kyuss.50 million year trip</a>
						<br/><a class="a1" href="javascript:void(null)">06.muse.knights of cydonia</a>
						<br/><a class="a3" href="javascript:void(null)">07.clint mansell.lux aeterna</a>
						<br/><a class="a1" href="javascript:void(null)">08.chicago.hard to say i'm sorry</a>
						<br/><a class="a3" href="javascript:void(null)">09.beastie boys.sabotage</a>
						<br/><a class="a1" href="javascript:void(null)">10.fallout boy.homesick at spacecamp</a>
						<br/>
					</div>						
						
						
				</div>

				<div class="contentsleft">

					<div class="d21">
						<a class="a1" href="javascript:void(null)">ku.oc.yacedlaitnenopxe || exponentialdecay.co.uk</a>
						<p class="a1">
							<xsl:value-of select="page/section/intro"/>
						</p>
					</div>

					<div class="superfluouspadding">
						<br/>
					</div>

					<div class="d51">
						<br></br>
						real life
						<br></br>
						<a href="http://www.exponentialdecay.co.uk/rss/rss.xml"><img class="rss" src="http://www.exponentialdecay.co.uk/images/rss.jpg" alt="rss feed"></img></a>
						<br></br>
						an rss feed to real life... 
						<br/><br/>
					</div>

					<div class="d61">
						<br/><br/>
						products
						<br/>
						<p>
							<br/><a class="a2" target="_blank" href="http://www.amazon.com/gp/product/B000767QTA?ie=UTF8&amp;tag=exponentialde-20&amp;linkCode=as2&amp;camp=1789&amp;creative=9325&amp;creativeASIN=B000767QTA">Neon Genesis Evangelion: Platinum Collection</a><img src="http://www.assoc-amazon.com/e/ir?t=exponentialde-20&amp;l=as2&amp;o=1&amp;a=B000767QTA" width="1" height="1" border="0" alt="" style="border:none; margin:0px;" />
							<br/><a class="a2" target="_blank" href="http://www.amazon.com/gp/product/B000UAE7O0?ie=UTF8&amp;tag=exponentialde-20&amp;linkCode=as2&amp;camp=1789&amp;creative=9325&amp;creativeASIN=B000UAE7O0">Grindhouse Presents, Planet Terror</a><img src="http://www.assoc-amazon.com/e/ir?t=exponentialde-20&amp;l=as2&amp;o=1&amp;a=B000UAE7O0" width="1" height="1" border="0" alt="" style="border:none; margin:0px;" />
							<br/><a class="a2" target="_blank" href="http://www.amazon.com/gp/product/B000R7HY0K?ie=UTF8&amp;tag=exponentialde-20&amp;linkCode=as2&amp;camp=1789&amp;creative=9325&amp;creativeASIN=B000R7HY0K">Grindhouse Presents, Death Proof</a><img src="http://www.assoc-amazon.com/e/ir?t=exponentialde-20&amp;l=as2&amp;o=1&amp;a=B000R7HY0K" width="1" height="1" border="0" alt="" style="border:none; margin:0px;" />
							<br/><a class="a2" target="_blank" href="http://www.amazon.co.uk/gp/product/0672326973?ie=UTF8&amp;tag=exponentialde-21&amp;linkCode=as2&amp;camp=1634&amp;creative=6738&amp;creativeASIN=0672326973">C++ Primer Plus (Prata)</a><img src="http://www.assoc-amazon.co.uk/e/ir?t=exponentialde-21&amp;l=as2&amp;o=2&amp;a=0672326973" width="1" height="1" border="0" alt="" style="border:none; margin:0px;" />         
						</p> 
						<br></br>
					</div>

					<div class="d71">
						<br></br>
						miscellany
						<br/>
						<p>
						<xsl:for-each select="page/section/miscellany">
							<a class="a4" target="_blank" href="http://www.exponentialdecay.co.uk/{location}">
								<xsl:value-of select="title"/>
							</a><br/>
						</xsl:for-each>
						</p>
					</div>

					<div class="d81">
						<p>
							<br></br>
							high scores
							<br></br>
							<br/>Tetris: <a class="a5" href="javascript:void(null)">1,577,680 points</a>
							<br/>Pokemon [blue]: 150 Pokemon, <a class="a5" href="javascript:void(null)">26hrs 35mins</a>
							<br/>Matt Hoffmans Pro BMX 2: Biggest Combo, <a class="a5" href="javascript:void(null)">1,000,000 points</a>
							<br/>The Legend of Zelda: Twilight Princess,  <a class="a5" href="javascript:void(null)">34hrs 25mins</a> 
							<br></br>
						</p>
					</div>

					<div class="techno1">
						<br></br>
						...
						<br></br>
						<script src="http://widgets.technorati.com/t.js" type="text/javascript"></script>
						<a href="http://technorati.com/?sub=tr_top-news_t_js" class="tr_top-news_t_js" style="color:white"></a>
						<br></br>
					</div>

				</div>
				
				<div class="d4copy" id="copyright">
					<br></br>
					&#169; <a class="a5" href="#">Ross Spencer</a> 2008 - unless otherwise stated<br/>
					-two words, plausible deniability-
				</div>

			</div>

		</body>

	</html>
	
</xsl:template>

</xsl:stylesheet>

