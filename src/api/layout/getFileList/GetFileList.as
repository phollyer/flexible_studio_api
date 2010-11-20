package api.layout.getFileList
{
	import api.events.layout.getFileList.GetFileListEvent;

	import api.layout.Layout;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.layout.getFileList.GetFileListEvent.RESULT
	*/
	[Event(name="result", type="api.events.layout.getFileList.GetFileListEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Layout_getFileList.html Northcode Help Documentation
	*/
	public class GetFileList extends Layout
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
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var fileList:Array = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var text:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var xml:XML = null;
		
		/**
		* Constructor for Layout.GetFileList()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Layout_getFileList.html Northcode Help Documentation
		*/
		public function GetFileList(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Layout_getFileList.html Northcode Help Documentation
		*/
		public function getFileList():void
		{
			switch( format )
			{
				case TEXT_FORMAT:
				case XML_FORMAT:
					ssCore.Layout.getFileList( {format:format}
											  ,{callback:actionComplete, errorSTR:"getFileListError", code:"26001"} );
					break;
				default:
					invalidFormat();
			}
		}
		private function invalidFormat():void
		{
			var e : GetFileListEvent = new GetFileListEvent( GetFileListEvent.RESULT_FORMAT );
			dispatchEvent( e );
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
			fileList = null;
			text = null;
			xml = null;
			
			switch( format )
			{
				case TEXT_FORMAT:
					text = r.result;
					fileList = text.split( CR );
					break;
				case XML_FORMAT:
					xml = XML( r.result );
			}
			
			var e : GetFileListEvent = new GetFileListEvent( GetFileListEvent.RESULT );
			e.fileList = fileList;
			e.text = text;
			e.xml = xml;
			dispatchEvent( e );
		}
	}
}