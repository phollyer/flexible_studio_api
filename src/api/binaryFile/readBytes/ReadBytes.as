package api.binaryFile.readBytes
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	import api.events.binaryFile.read.ReadBytesEvent;
	import api.vos.binaryFile.FormatVO;
	
	[Event(name="missingFormat" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.binaryFile.readBytes.ReadBytesEvent")]
	[Bindable]
	public class ReadBytes extends BinaryFile
	{
		// Required
		public var format:String = null;
		public var size:Number = -1;
		
		// Results
		public var bytesRead:Number = 0;
		public var systemError:String = null;
		public var text:String = null;
		
		public function ReadBytes(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function readBytes( readFormat:String = null , bytesToRead:Number = -1 ):void
		{
			format = compareStrings( readFormat , format );
			switch( format )
			{
				case null:
					missingFormat();
					break;
				case FormatVO.BYTE:
				case FormatVO.HEX:
				case FormatVO.UTF8:
					checkSize( bytesToRead );
					break;
				default:
					invalidFormat();
			}
		}
		private function checkSize( bytesToRead:Number ):void
		{
			size = compareNumbers( bytesToRead , size );
			switch( size > 0 )
			{
				case true:
					read();
				case false:
					invalidSize();				
			}
		}
		private function read():void
		{
			ssCore.BinaryFile.readBytes( {format:format , size:String(size )} , {callback:actionComplete, errorSTR:"readBytesError", code:"11008"} );
		}
		override protected function sendResult( r:Object ):void
		{
			bytesRead = Number( r.bytesRead );
			text = r.result;
			
			var e : ReadBytesEvent = new ReadBytesEvent( ReadBytesEvent.RESULT );
			e.bytesRead = bytesRead;
			e.systemError = systemError;
			e.text = text;
			dispatchEvent( e );
		}
		private function invalidFormat():void
		{
			var e : ReadBytesEvent = new ReadBytesEvent( ReadBytesEvent.RESULT_FORMAT );
			dispatchEvent( e );
		}
		private function invalidSize():void
		{
			var e : ReadBytesEvent = new ReadBytesEvent( ReadBytesEvent.RESULT_SIZE );
			dispatchEvent( e );
		}
	}
}