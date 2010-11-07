package api.fileSys.readFileUTF8
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.readFileUTF8.ReadFileUTF8Event;
	import api.fileSys.FileSys;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.fileSys.readFileUTF8.ReadFileUTF8Event")]
	[Bindable]
	public class ReadFileUTF8 extends FileSys
	{
		// Optional
		public var requireBOM:Boolean = true;
		
		// Required
		public var path:String = null;
		
		// Result
		public var data:String = null;
		
		public function ReadFileUTF8(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function readFileUTF8( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.readFileUTF8( {path:path , requireBOM:requireBOM}
											,{callback:actionComplete, errorSTR:"readFileUTF8Error", code:"9029"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			
			var e : ReadFileUTF8Event = new ReadFileUTF8Event( ReadFileUTF8Event.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}