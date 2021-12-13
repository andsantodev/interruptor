defmodule InterruptorWeb.InterruptorLive do
  use InterruptorWeb, :live_view

  # Definindo variavel e valor
  def mount(_params, _session, socket) do
    # forma simples quando apenas precisa mudar um status
    # socket = assign(socket, :light_bulb_status, "off")

    # forma mais complexa quando mais coisas precisam ser mudadas
    socket =
      socket
      |> assign(:light_bulb_status, "off") # de inicio o status é off
      |> assign(:on_button_status, "") # o button On fica ativo
      |> assign(:off_button_status, "disabled") # o button Off fica inativo

    {:ok, socket}
  end

  # Renderização do conteudo
  def render(assigns) do
    ~L"""
      <%# a variavel @light_bulb_status recebe a frase/status %>
      <h1> The light is <%= @light_bulb_status %>!</h1>

      <%# as variaveis @on_button_status e @off_button_status definem se ficam ativas ou intaivas %>
      <button phx-click="on" <%= @on_button_status %> >On</button>
      <button phx-click="off" <%= @off_button_status %> >Off</button>
    """
  end

  # Definindo o evento phx-click="on"
  def handle_event("on", _value, socket) do
    socket =
      socket
        # se o status ativo for On, o botão On fica desabilitado
        |> assign(:light_bulb_status, "on")
        |> assign(:on_button_status, "disabled")
        |> assign(:off_button_status, "")

        {:noreply, socket}

    # como se trata de um evento simples
    # o mesmo poderia ser feito desta forma:
    # {:noreply, assign(socket, :light_bulb_status, "on")}
  end

  # Definindo o evento phx-click="off"
  def handle_event("off", _value, socket) do
    socket =
      socket
        # se o status ativo for Off, o botão Off fica desabilitado
        |> assign(:light_bulb_status, "off")
        |> assign(:on_button_status, "")
        |> assign(:off_button_status, "disabled")

        {:noreply, socket}

    # como se trata de um evento simples
    # o mesmo poderia ser feito desta forma:
    # {:noreply, assign(socket, :light_bulb_status, "off")}
  end
end
