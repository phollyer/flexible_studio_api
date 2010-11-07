package api.binaryFile.flushToDisk
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	[Bindable]
	public class FlushToDisk extends BinaryFile
	{
		// Result
		public var systemError:String = null;
		
		public function FlushToDisk(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function flushToDisk():void
		{
			ssCore.BinaryFile.flushToDisk( {} , {callback:actionComplete, errorSTR:"flushToDiskError", code:"11003"} );
		}
	}
}