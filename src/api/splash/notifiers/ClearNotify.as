package api.splash.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.splash.notifiers.ClearNotifyEvent;
	import api.splash.Splash;

	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends Splash
	{
		public var event:String = null;
		
		public function ClearNotify(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function clearNotify( eventName:String = null ):void
		{
			event = compareStrings( eventName , event );
			switch( event )
			{
				case null:
					missingEvent();
					break;
				default:
					ssCore.Splash.clearNotify( {event:event} , {callback:actionComplete, errorSTR:"clearNotifyError", code:"5004"} );
			}
		}
	}
}