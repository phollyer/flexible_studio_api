package api.scratch.read
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.scratch.read.ReadEvent;
	import api.scratch.Scratch;
	
	[Event(name="result", type="api.events.scratch.read.ReadEvent")]
	[Bindable]
	public class Read extends Scratch
	{
		// Optional
		public var binary:Boolean = false;
		public var secure:Boolean = false;
		
		// Result
		public var data:String = null;
		
		public function Read(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function read():void
		{
			ssCore.Scratch.read( {binary:binary , secure:secure}
								,{callback:actionComplete, errorSTR:"readError", code:"34000"} );
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			
			var e : ReadEvent = new ReadEvent( ReadEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}