[#-------------- RENDERING --------------]
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7" xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8" xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9" xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}"><![endif]-->
<!--[if gt IE 8]><!--><html class="no-js" xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}"><!--<![endif]-->
<head>
    [@cms.page /]

    [@cms.area name="htmlHeader" contextAttributes={"pageDef":def} /]

    [#-- Scripts to be rendered in the header. --]
    [@cms.area name="headerScripts"/]
</head>
<body>
[#-- Scripts to be rendered at the beginning of the body. --]
[@cms.area name="bodyBeginScripts"/]
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
[@cms.area name="navigation"/]

[@cms.area name="main"/]

[@cms.area name="footer"/]

<script>window.jQuery || document.write('<script src="${ctx.contextPath}/.resources/travel-demo-theme/js/jquery-1.10.2.min.js"><\/script>')</script>

[#-- We're using the prototype's jsFiles to be rendered at the bottom of the page --]
[#if def.jsFiles??]
    [#list def.jsFiles as jsFile]
        <script src="${jsFile.link}"></script>
    [/#list]
[/#if]
[#-- Scripts to be rendered at the end of the body. --]
[@cms.area name="bodyEndScripts"/]

[#assign currentNode = cmsfn.asJCRNode(content)]
[#assign tourCategory = tourfn.categoryByUrl]
[#switch currentNode.path]
    [#case "/travel/tour"]
        ${insightsFn.getTrackJS("tour","tours",true)}
        [#break]
    [#case "/travel/tour-type"]
        ${insightsFn.getTrackJS(tourCategory.identifier,"category",true, true)}
        [#break]
    [#default]
        ${insightsFn.getTrackJS(currentNode.path)}
[/#switch]

</body>
</html>
