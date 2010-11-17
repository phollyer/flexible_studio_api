package api.binaryFile.writeBytes
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	import api.events.binaryFile.writeBytes.WriteBytesEvent;
	import api.vos.binaryFile.FormatVO;
	
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Event(name="missingFormat" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.binaryFile.writeBytes.WriteBytesEvent")]
	[Bindable]
	public class WriteBytes extends BinaryFile
	{
		// Required
		public var data:String = null;
		public var format:String = null;
		
		// Results
		public var bytesWritten:Number = 0;
		public var systemError:String = null;
		
		public function WriteBytes(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function writeBytes( dataSTR:String = null , formatSTR:String = null ):void
		{
			data = compareStrings( dataSTR , data );
			format = compareStrings( formatSTR , format );
			switch( data )
			{
				case null:
					missingData();
					break;
				default:
					checkFormat();
			}
		}
		public function checkFormat():void
		{
			switch( format )
			{
				case null:
					missingFormat();
					break;
				case FormatVO.BYTE:
				case FormatVO.HEX:
				case FormatVO.UTF8:
					write();
					break;
				default:
					invalidFormat();
			}
		}
		private function write():void
		{
			ssCore.BinaryFile.writeBytes( {data:data , format:format} , {callback:actionComplete, errorSTR:"writeBytesError", code:"11012"} );
		}
		override protected function sendResult( r:Object ):void
		{
			bytesWritten = Number( r.bytesWritten );
			var e : WriteBytesEvent = new WriteBytesEvent( WriteBytesEvent.RESULT );
			e.bytesWritten = bytesWritten;
			e.systemError = systemError;
			dispatchEvent( e );
		}
		private function invalidFormat():void
		{
			var e : WriteBytesEvent = new WriteBytesEvent( WriteBytesEvent.RESULT_FORMAT );
			dispatchEvent( e );
		}

	}
}