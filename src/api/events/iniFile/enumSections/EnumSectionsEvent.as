package api.events.iniFile.enumSections
{
	import flash.events.Event;
	
	import api.events.iniFile.IniFileEvent;

	public class EnumSectionsEvent extends IniFileEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var sections:Array = null;
		
		public function EnumSectionsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EnumSectionsEvent = new EnumSectionsEvent( type );
			e.sections = sections;
			return e;
		}
	}
}