define(['oxjs'], function(OXJS) {
	var ls_key = 'CodeCheck',
		silence_ts = .5 * 3600 * 1000, //.5 hours
		storeObj = JSON.parse(localStorage.getItem(ls_key) || '{}');

	return {
		init: function($mod) {

			this.$mod = $mod;

			this.result_url = $mod.attr('data-resulturl')||''
			this.active_url = $mod.attr('data-activeurl')||''
			this.notify_url = $mod.attr('data-notifyurl')||''

			if(!this.result_url){
				OXJS.toast('result_url not config')
			}else if(!this.active_url){
				OXJS.toast('active_url not config')
			}else if(!this.notify_url){
				OXJS.toast('notify_url not config')
			}else{
				this.checkForm($('form', $mod));
			}


			

		},
		checkForm: function($f) {
			var f = $f[0],
				_id = f._id.value,
				status = f.status.value,
				code = f.code.value,
				idItem = storeObj[_id];
			if (status == 0) {
				location.href=this.active_url;
			}else if (idItem && (new Date) - idItem.ts < silence_ts) {
				location.href = this.result_url + '?code=1&message=' + encodeURIComponent('半小时内不必重复通知')
			}else {
				location.href=this.notify_url+'?_id='+code;
				
			}

		}
	}
})