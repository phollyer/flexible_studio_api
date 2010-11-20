package api.events.ado.moveFirst
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class MoveFirstEvent extends AdoEvent
	{		
		public var adoError:String = null;
		public var row:String = null;
		
		public function MoveFirstEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MoveFirstEvent = new MoveFirstEvent( type );
			e.adoError = adoError;
			e.row = row;
			return e;
		}
	}
}