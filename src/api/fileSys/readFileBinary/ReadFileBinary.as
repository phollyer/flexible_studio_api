package api.fileSys.readFileBinary
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.readFileBinary.ReadFileBinaryEvent;
	import api.fileSys.FileSys;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.fileSys.readFileBinary.ReadFileBinaryEvent")]
	[Bindable]
	public class ReadFileBinary extends FileSys
	{
		// Required
		public var path:String = null;
		
		// Result
		public var data:String = null;
		
		public function ReadFileBinary(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function readFileBinary( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.readFileBinary( {path:path}
											,{callback:actionComplete, errorSTR:"readFileBinaryError", code:"9009"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			
			var e : ReadFileBinaryEvent = new ReadFileBinaryEvent( ReadFileBinaryEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}