<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.code-check">
    	<xsl:param name="result_url"></xsl:param>
    	<xsl:param name="active_url">active</xsl:param>
    	<xsl:param name="notify_url">notify</xsl:param>
    	<!-- 更贴切地讲，这种应该属于router -->
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-code-check" ox-mod="code-check" 
        	data-resulturl="{$result_url}" data-activeurl="{$active_url}" data-notifyurl="{$notify_url}">
        	<form>
	            <xsl:choose>
	            	<xsl:when test="data/code/_id">
	            		<input type="hidden" name="_id" value="{data/code/_id}"/>
	            		<input type="hidden" name="tid" value="{data/code/tid}"/>
	            		<input type="hidden" name="expire" value="{data/code/expire}"/>
	            		<input type="hidden" name="status" value="{data/code/status}"/>
	            		<input type="hidden" name="code" value="{q/_id}"/>
	            	</xsl:when>
	            	<xsl:otherwise>
	            		<h3 class="error">无效数据</h3>
	            	</xsl:otherwise>
	            </xsl:choose>
	        </form>
        </div>
    </xsl:template>
</xsl:stylesheet>
