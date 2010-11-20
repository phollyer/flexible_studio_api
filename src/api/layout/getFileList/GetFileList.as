package api.layout.getFileList
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.layout.getFileList.GetFileListEvent;
	import api.layout.Layout;
	
	[Event(name="result", type="api.events.layout.getFileList.GetFileListEvent")]
	[Bindable]
	public class GetFileList extends Layout
	{
		public static const TEXT_FORMAT:String = "TEXT";
		public static const XML_FORMAT:String = "XML";
		
		// Optional
		public var format:String = TEXT_FORMAT;
		
		// Result
		public var fileList:Array = null;
		public var text:String = null;
		public var xml:XML = null;
		
		public function GetFileList(target:IEventDispatcher=null)
		{
			super(target);
		}
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