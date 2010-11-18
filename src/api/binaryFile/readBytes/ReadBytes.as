package api.binaryFile.readBytes
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	import api.events.binaryFile.read.ReadBytesEvent;
	import api.vos.binaryFile.FormatVO;
	
	/**
	 * Dispatched if the Property <code>format</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_FORMAT
	 */
	[Event(name="missingFormat" , type="api.events.SWFStudioEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.binaryFile.readBytes.ReadBytesEvent.RESULT
	 */
	[Event(name="result", type="api.events.binaryFile.readBytes.ReadBytesEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_readBytes.html Northcode Help Documentation
	 */
	public class ReadBytes extends BinaryFile
	{
		// Required
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var format:String = null;
		public var size:Number = -1;
		
		// Results
		/**
		 * 
		 *
		 * @defaultValue <code>0</code>
		 */
		public var bytesRead:Number = 0;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var systemError:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var text:String = null;
		
		/**
		 * Constructor for BinaryFile.ReadBytes()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_readBytes.html Northcode Help Documentation
		 */
		public function ReadBytes(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param readFormat
                 *
		 * @param bytesToRead
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_readBytes.html Northcode Help Documentation
		 */
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
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
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