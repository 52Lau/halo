<script type="text/javascript">
    <#if settings.hitokoto!false>
    var xhr = new XMLHttpRequest();
    xhr.open('get', 'https://v1.hitokoto.cn');
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var data = JSON.parse(xhr.responseText);
            var yiyan = document.getElementById('yiyan');
            yiyan.innerText = data.hitokoto+"        -「"+data.from+"」";
        }
    };
    xhr.send();
    </#if>
</script>