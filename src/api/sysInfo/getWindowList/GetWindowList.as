package api.sysInfo.getWindowList
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getWindowList.GetWindowListEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.getWindowList.GetWindowListEvent")]
	[Bindable]
	public class GetWindowList extends SysInfo
	{
		public static const TEXT_FORMAT:String = "TEXT";
		public static const XML_FORMAT:String = "XML";
		
		// Optional
		public var format:String = TEXT_FORMAT;
		public var showHidden:Boolean = false;
		public var showProcessId:Boolean = false;
		
		// Result
		public var windowList:Array = null;
		public var windowListXML:XML = null;
		
		public function GetWindowList(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getWindowList():void
		{
			ssCore.SysInfo.getWindowList( {format:format , showHidden:showHidden , showProcessId:showProcessId}
									   	 ,{callback:actionComplete, errorSTR:"getWindowListError", code:"38015"} );
		}
		override protected function sendResult( r:Object ):void
		{
			windowList = null;
			windowListXML = null;
			
			var e : GetWindowListEvent = new GetWindowListEvent( GetWindowListEvent.RESULT );
			
			switch( format )
			{
				case TEXT_FORMAT:
					windowList = extractArray( r.result );
					break;
				case XML_FORMAT:
					windowListXML = new XML( r.result );
			}			
			
			e.windowList = windowList;
			e.windowListXML = windowListXML;
			dispatchEvent( e );
		}
		private function extractArray( s:String ):Array
		{
			var __r:Array = new Array();
			var __a:Array = s.split( CR );
			for( var i:int = 0 ; i < __a.length ; i++ )
			{
				var __b:Array = __a[ i ].split( TAB );
				__r.push( __b );
			}
			
			return __r;
		}
	}
}