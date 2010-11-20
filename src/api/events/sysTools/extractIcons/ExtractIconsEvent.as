package api.events.sysTools.extractIcons
{
	import flash.events.Event;
	
	import api.events.sysTools.SysToolsEvent;

	public class ExtractIconsEvent extends SysToolsEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_FOLDER:String = "missingFolder";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var icoFiles:Array = null;
		
		public function ExtractIconsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ExtractIconsEvent = new ExtractIconsEvent( type );
			e.icoFiles = icoFiles;
			return e;
		}
	}
}