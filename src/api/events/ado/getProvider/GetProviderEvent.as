package api.events.ado.getProvider
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class GetProviderEvent extends AdoEvent
	{		
		public var provider:String = null;
		
		public function GetProviderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetProviderEvent = new GetProviderEvent( type );
			e.provider = provider;
			return e;
		}
	}
}