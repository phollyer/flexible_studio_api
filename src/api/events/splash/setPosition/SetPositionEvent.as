package api.events.splash.setPosition
{
	import flash.events.Event;
	
	public class SetPositionEvent extends Event
	{
		public static const COMPLETE					:String					= "complete";
		
		public function SetPositionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e										:SetPositionEvent		= new SetPositionEvent(type);
			return e;
		}
	}
}