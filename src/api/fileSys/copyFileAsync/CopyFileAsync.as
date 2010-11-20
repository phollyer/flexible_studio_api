package api.fileSys.copyFileAsync
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;
	
	[Event(name="missingFromPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingToPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class CopyFileAsync extends FileSys
	{
		// Optional
		public var failIfExists:Boolean = false;
		public var chunkSize:Number = 8192;
		
		// Required
		public var fromPath:String = null;
		public var toPath:String = null;
		
		public function CopyFileAsync(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function copyFileAsync( fromSTR:String = null , toSTR:String = null ):void
		{
			fromPath = compareStrings( fromSTR , fromPath );
			toPath = compareStrings( toSTR , toPath );
			
			switch( fromPath )
			{
				case null:
					missingFromPath();
					break;
				default:
					switch( toPath )
					{
						case null:
							missingToPath();
							break;
						default:
							copy();
					}
			}
		}
		private function copy():void
		{
			ssCore.FileSys.copyFileAsync( {from:fromPath , to:toPath , chunkSize:chunkSize , failIfExists:failIfExists}
									,{callback:actionComplete, errorSTR:"copyFileAsyncError", code:"9018"} );
		}

	}
}