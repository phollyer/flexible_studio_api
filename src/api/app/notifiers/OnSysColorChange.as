package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnSysColorChangeEvent;
	
	[Bindable]
	public class OnSysColorChange extends App
	{
		public function OnSysColorChange(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_SYS_COLOR_CHANGE} , {callback:actionComplete, errorSTR:"onSysColorChangeError", code:"8032"} );
		}
		}		
	}
}