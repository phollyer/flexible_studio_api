package api.scratch.read
{
	import api.events.scratch.read.ReadEvent;

	import api.scratch.Scratch;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.scratch.read.ReadEvent.RESULT
	*/
	[Event(name="result", type="api.events.scratch.read.ReadEvent")]
	[Bindable]
	/**
	* Read the file from the scratch area in your application and save it to disk.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Scratch_read.html Northcode Help Documentation
	*/
	public class Read extends Scratch
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var binary:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var secure:Boolean = false;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Scratch.Read()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Scratch_read.html Northcode Help Documentation
		*/
		public function Read(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Read the file from the scratch area in your application and save it to disk.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Scratch_read.html Northcode Help Documentation
		*/
		public function read():void
		{
			ssCore.Scratch.read( {binary:binary , secure:secure}
								,{callback:actionComplete, errorSTR:"readError", code:"34000"} );
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
			data = r.result;
			
			var e : ReadEvent = new ReadEvent( ReadEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}