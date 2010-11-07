package api.errors
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class SWFStudioError extends Event
	{		
		public static const ERROR:String = "error";		
		
		public var code:String = null;
		public var command:String = null;
		public var errorItem:Object = null;
		public var errorLog:ArrayCollection = new ArrayCollection();
		
		public function SWFStudioError(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var e : SWFStudioError = new SWFStudioError( type );
			e.code = code;
			e.command = command;
			e.errorItem = errorItem;
			e.errorLog = errorLog; 
			return e;
		}
	}
}