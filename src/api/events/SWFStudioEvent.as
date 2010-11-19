package api.events
{
	import flash.events.Event;

	public class SWFStudioEvent extends Event
	{
		public static const ACTION_COMPLETE : String = "actionComplete";
		public static const MISSING_CRITERIA : String = "missingCriteria";
		public static const MISSING_DATA :String = "missingData";
		public static const MISSING_DIRECTION :String = "missingDirection";
		public static const MISSING_EVENT : String = "missingEvent";
		public static const MISSING_FILE_OBJ : String = "missingFileObj";
		public static const MISSING_FORMAT : String = "missingFormat";
		public static const MISSING_HWND : String = "missingHwnd";
		public static const MISSING_METHOD : String = "missingMethod";
		public static const MISSING_NUMBER : String = "missingNumber";
		public static const MISSING_OBJECT : String = "missingObject";
		public static const MISSING_PATH :String = "missingPath";
		public static const MISSING_PRIORITY : String = "missingPriority";
		public static const MISSING_PROG_ID : String = "missingProgId";
		public static const MISSING_PROMPT : String = "missingPrompt";
		public static const MISSING_PROPERTY : String = "missingProperty";
		public static const MISSING_SQL :String = "missingSql";
		public static const MISSING_STRING : String = "missingString";
		public static const MISSING_TEXT : String = "missingText";
		public static const MISSING_VALUE : String = "missingValue";
		public static const RESULT : String = "result";
		
		public function SWFStudioEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}		
		
		override public function clone():Event
		{
			var newEvent:SWFStudioEvent = new SWFStudioEvent( type );
			return newEvent;
		}
	}
}