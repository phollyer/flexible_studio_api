package api.events.ado.execSQL
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class ExecSQLEvent extends AdoEvent
	{		
		public var adoError:String = null;
		
		public function ExecSQLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ExecSQLEvent = new ExecSQLEvent( type );
			e.adoError = adoError;
			return e;
		}
	}
}