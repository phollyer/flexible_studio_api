package api.binaryFile.setSize
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	[Bindable]
	public class SetSize extends BinaryFile
	{
		// Required
		public var bytes:Number = -1;
		
		// Results
		public var systemError:String = null;
		
		public function SetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setSize( bytesSize:Number = -1 ):void
		{
			bytes = compareNumbers( bytesSize , bytes );
			switch( bytes > 0 )
			{
				case true:
					setBytesSize();
					break;
				case false:
					invalidSize();
			}
		}
		private function setBytesSize():void
		{
			ssCore.BinaryFile.setSize( {bytes:String( bytes )} , {callback:actionComplete, errorSTR:"setSizeError", code:"11010"} );
		}
		private function invalidSize():void
		{
			var e : SetSizeEvent = new SetSizeEvent( SetSizeEvent.RESULT_SIZE );
			dispatchEvent( e );
		}
	}
}