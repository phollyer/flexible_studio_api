package api.sysInfo.getWindowList
{
	import api.events.sysInfo.getWindowList.GetWindowListEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getWindowList.GetWindowListEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getWindowList.GetWindowListEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getWindowList.html Northcode Help Documentation
	*/
	public class GetWindowList extends SysInfo
	{
		public static const TEXT_FORMAT:String = "TEXT";
		public static const XML_FORMAT:String = "XML";
		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>TEXT_FORMAT</code>
		*/
		public var format:String = TEXT_FORMAT;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var showHidden:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var showProcessId:Boolean = false;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var windowList:Array = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var windowListXML:XML = null;
		
		/**
		* Constructor for SysInfo.GetWindowList()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getWindowList.html Northcode Help Documentation
		*/
		public function GetWindowList(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getWindowList.html Northcode Help Documentation
		*/
		public function getWindowList():void
		{
			ssCore.SysInfo.getWindowList( {format:format , showHidden:showHidden , showProcessId:showProcessId}
									   	 ,{callback:actionComplete, errorSTR:"getWindowListError", code:"38015"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
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