package api.scratch.write
{
	import api.events.scratch.write.WriteEvent;

	import api.scratch.Scratch;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched if the Property <code>data</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_DATA
	 */
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_Scratch_write.html Northcode Help Documentation
	 */
	public class Write extends Scratch
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
		
		// Required
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var data:String = null;
		
		/**
		 * Constructor for Scratch.Write()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_Scratch_write.html Northcode Help Documentation
		 */
		public function Write(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param dataSTR
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_Scratch_write.html Northcode Help Documentation
		 */
		public function write( dataSTR:String = null ):void
		{
			data = compareStrings( dataSTR , data );
			
			switch( data )
			{
				case null:
					missingData();
					break;
				default:
					ssCore.Scratch.write( {data:data , binary:binary , secure:secure}
										 ,{callback:actionComplete, errorSTR:"writeError", code:"34001"} );
			}
		}
	}
}