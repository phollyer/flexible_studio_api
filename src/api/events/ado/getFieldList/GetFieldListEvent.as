package api.events.ado.getFieldList
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class GetFieldListEvent extends AdoEvent
	{		
		public var fieldList:Array = null;
		
		public function GetFieldListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFieldListEvent = new GetFieldListEvent( type );
			e.fieldList = fieldList;
			return e;
		}
	}
}