package api.binaryFile.close
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	[Bindable]
	public class Close extends BinaryFile
	{
		// Result
		public var systemError:String = null;
		
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function close():void
		{
			ssCore.BinaryFile.close( {} , {callback:actionComplete, errorSTR:"closeError", code:"11001"} );
		}
	}
}