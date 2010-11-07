package api.ftp.bufferSize
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;
	
	[Bindable]
	public class BufferSize extends Ftp
	{
		// Optional
		public var size:Number = 8192;
		
		public function BufferSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function bufferSize():void
		{
			ssCore.Ftp.bufferSize( {size:size}
								  ,{callback:actionComplete, errorSTR:"bufferSizeError", code:"7007"} );
		}
	}
}