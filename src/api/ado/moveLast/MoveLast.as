package api.ado.moveLast
{
	import api.ado.Ado;

	import api.events.ado.moveLast.MoveLastEvent;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.ado.moveLast.MoveLastEvent.RESULT
	*/
	[Event(name="result", type="api.events.ado.moveLast.MoveLastEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveLast.html Northcode Help Documentation
	*/
	public class MoveLast extends Ado
	{
		// Results
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var adoError:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var row:String = null;
		
		/**
		* Constructor for Ado.MoveLast()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveLast.html Northcode Help Documentation
		*/
		public function MoveLast(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveLast.html Northcode Help Documentation
		*/
		public function moveLast():void
		{
			ssCore.Ado.moveLast( {} , {callback:actionComplete, errorSTR:"moveLastError", code:"16012"} );
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
			adoError = r.adoError;
			row = r.result;
			
			var e : MoveLastEvent = new MoveLastEvent( MoveLastEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}