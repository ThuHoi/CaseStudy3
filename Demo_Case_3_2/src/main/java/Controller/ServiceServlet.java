package Controller;

import Modal.Film;
import Service.FilmService;
import Service.VeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(urlPatterns = "/dichvu")
public class ServiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action==null){
            action="";
        }
        RequestDispatcher requestDispatcher;
        switch (action){
            case "chonghe":
                int idPhim = Integer.parseInt(req.getParameter("idPhim"));
                req.setAttribute("idPhim",idPhim);
                Film film= FilmService.films.get(FilmService.vtPhim(idPhim));
                req.setAttribute("img", film.getImg());
                req.setAttribute("tenPhim", film.getTenPhim());
                req.setAttribute("loaiPhim",film.getLoaiPhim());
                req.setAttribute("quocGia",film.getQuocGia());
                req.setAttribute("thoiGian",film.getThoiGian());
                req.setAttribute("ngayKhoiChieu",film.getNgayKhoiChieu());
                int idUser = Integer.parseInt(req.getParameter("idUser"));
                req.setAttribute("idUser",idUser);
                requestDispatcher = req.getRequestDispatcher("/Ghe.jsp");
                requestDispatcher.forward(req,resp);
                break;
            case  "cart":
                int idUser1 = Integer.parseInt(req.getParameter("idUser"));
                req.setAttribute("listVe", VeService.listVeByIdUser(idUser1));
                int quantityTicket = VeService.listVeByIdUser(idUser1).size();
                req.setAttribute("quantity",quantityTicket);
                requestDispatcher = req.getRequestDispatcher("/Cart.jsp");
                requestDispatcher.forward(req,resp);
        }
    }
}
