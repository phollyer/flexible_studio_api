package api.tray.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.tray.notifiers.OnTrayHoverEvent;
	import api.tray.Tray;
	
	[Bindable]
	public class OnTrayHover extends Tray
	{				
		public function OnTrayHover(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tray.setNotify( {event:"onTrayHover"}
							 	  ,{callback:actionComplete, errorSTR:"onTrayHoverError", code:"43008"} );
		}
	}
}