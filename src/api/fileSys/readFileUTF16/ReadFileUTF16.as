package api.fileSys.readFileUTF16
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.readFileUTF16.ReadFileUTF16Event;
	import api.fileSys.FileSys;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.fileSys.readFileUTF16.ReadFileUTF16Event")]
	[Bindable]
	public class ReadFileUTF16 extends FileSys
	{
		// Optional
		public var requireBOM:Boolean = true;
		
		// Required
		public var path:String = null;
		
		// Result
		public var data:String = null;
		
		public function ReadFileUTF16(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function readFileUTF16( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.readFileUTF16( {path:path , requireBOM:requireBOM}
											,{callback:actionComplete, errorSTR:"readFileUTF16Error", code:"9028"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			
			var e : ReadFileUTF16Event = new ReadFileUTF16Event( ReadFileUTF16Event.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}