<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	$(".stuk").css("cursor", "pointer");

	$(".stuk").click(function() {
		$("#veld_vanwestoost").val($(".westoost", this).text());
		$("#veld_vannoordzuid").val($(".noordzuid", this).text());
	});
</script>