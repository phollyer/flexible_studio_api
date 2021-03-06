package api.email.send
{
	import api.email.Email;

	import api.events.email.send.SendEvent;

	import api.vos.email.SendVO;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>toAddress</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_TO_ADDRESS
	*/
	[Event(name="missingToAddress" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.email.send.SendEvent.RESULT
	*/
	[Event(name="result", type="api.events.email.send.SendEvent")]
	[Bindable]
	public class Send extends Email
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var sendSettings:SendVO = new SendVO();
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var serverResponse:String = null;
		
		/**
		* Constructor for Email.Send()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Email_send.html Northcode Help Documentation
		*/
		public function Send(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param sendToAddress
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Email_send.html Northcode Help Documentation
		*/
		public function send( sendToAddress:String = null ):void
		{
			sendSettings.toAddress = compareStrings( sendToAddress , sendSettings.toAddress );
			switch( sendSettings.toAddress )
			{
				case null:
					missingToAddress();
					break;
				default:
					var __o : Object = sendSettings.createEmail();
					ssCore.EMail.send( __o , {callback:actionComplete, errorSTR:"sendError", code:"20000"} );
			}
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
			var e : SendEvent = new SendEvent( SendEvent.RESULT );
			dispatchEvent( e );
		}
	}
}